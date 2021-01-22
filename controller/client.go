package controller

import (
	"bufio"
	"fmt"
	"os"

	servstat "github.com/muzudho/gtp-to-nngs/controller/servstat"
	e "github.com/muzudho/gtp-to-nngs/entities"
	"github.com/reiver/go-oi"
	"github.com/reiver/go-telnet"
)

// Client - クライアント
type Client struct {
	entryConf EntryConf
}

type clientListener struct {
	nngsListener e.NngsListener
	// １行で 1024 byte は飛んでこないことをサーバーと決めておけだぜ☆（＾～＾）
	lineBuffer [1024]byte
	index      uint

	// 状態遷移
	state int
}

// Spawn - クライアント接続
func (client Client) Spawn(entryConf EntryConf, nngsListener e.NngsListener) error {
	client.entryConf = entryConf
	return telnet.DialToAndCall(fmt.Sprintf("%s:%d", entryConf.Nngs.Host, entryConf.Nngs.Port), clientListener{
		index:        0,
		nngsListener: nngsListener})
}

// CallTELNET - 決まった形のメソッド。
func (c clientListener) CallTELNET(ctx telnet.Context, w telnet.Writer, r telnet.Reader) {
	go c.read(w, r)
	write(w)
}

// 送られてくるメッセージを待ち構えるループです。
func (c clientListener) read(w telnet.Writer, r telnet.Reader) {
	var buffer [1]byte // これが満たされるまで待つ。1バイト。
	p := buffer[:]

	for {
		n, err := r.Read(p) // 送られてくる文字がなければ、ここでブロックされます。

		if n > 0 {
			bytes := p[:n]
			c.lineBuffer[c.index] = bytes[0]
			c.index++
			// 改行がない行も届くので、改行が届くまで待つという処理ができません。
			print(string(bytes)) // 受け取るたびに表示。

			// 改行を受け取る前にパースしてしまおう☆（＾～＾）早とちりするかも知れないけど☆（＾～＾）
			c.parse(w)

			// 行末を判定できるか☆（＾～＾）？
			if bytes[0] == '\n' {
				// print("行末だぜ☆（＾～＾）！")
				c.index = 0
			}
		}

		if nil != err {
			break // 相手が切断したなどの理由でエラーになるので、終了します。
		}
	}
}

func (c clientListener) parse(w telnet.Writer) {
	// 現在読み取り中の文字なので、早とちりするかも知れないぜ☆（＾～＾）
	line := string(c.lineBuffer[:c.index])

	if line == "Login: " {
		// あなたの名前を入力してください。
		user := c.nngsListener.InputYourName()
		// fmt.Printf("[%s]を入力したいぜ☆（＾～＾）", user)

		// 強制的に名前は入力したことにするぜ☆（＾～＾）空白入れてはダメ☆（＾～＾）
		// if user != "" {
		oi.LongWrite(w, []byte(user))
		oi.LongWrite(w, []byte("\n"))
		//}

		c.state = servstat.EnteredMyName

	} else {

	}
}

// いつでも書き込んで送信できるようにするループです。
func write(w telnet.Writer) {
	// scanner - 標準入力を監視します。
	scanner := bufio.NewScanner(os.Stdin)
	// 一行読み取ります。
	for scanner.Scan() {
		// 書き込みます。最後に改行を付けます。
		oi.LongWrite(w, scanner.Bytes())
		oi.LongWrite(w, []byte("\n"))
	}
}
