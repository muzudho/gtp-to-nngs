package controller

import (
	"bufio"
	"fmt"
	"os"

	"github.com/reiver/go-oi"
	"github.com/reiver/go-telnet"
)

// Client - クライアント
type Client struct {
	entryConf EntryConf
}

type clientListener struct {
	// １行で 1024 byte は飛んでこないことをサーバーと決めておけだぜ☆（＾～＾）
	lineBuffer [1024]byte
	index      uint
}

// Spawn - クライアント接続
func (client Client) Spawn(entryConf EntryConf) error {
	client.entryConf = entryConf
	return telnet.DialToAndCall(fmt.Sprintf("%s:%d", entryConf.Nngs.Host, entryConf.Nngs.Port), clientListener{index: 0})
}

// CallTELNET - 決まった形のメソッド。
func (c clientListener) CallTELNET(ctx telnet.Context, w telnet.Writer, r telnet.Reader) {
	go c.read(r)
	write(w)
}

// 送られてくるメッセージを待ち構えるループです。
func (c clientListener) read(r telnet.Reader) {
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
