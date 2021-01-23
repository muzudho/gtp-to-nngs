package gateway

import (
	"bufio"
	"fmt"
	"os"
	"regexp"

	c "github.com/muzudho/gtp-to-nngs/controller"
	servstat "github.com/muzudho/gtp-to-nngs/controller/servstat"
	e "github.com/muzudho/gtp-to-nngs/entities"
	"github.com/reiver/go-oi"
	"github.com/reiver/go-telnet"
)

// NngsClient - クライアント
type NngsClient struct {
}

// `github.com/reiver/go-telnet` ライブラリーの動作をリスニングします
type libraryListener struct {
	entryConf c.EntryConf
	// NNGSの動作をリスニングします
	nngsListener e.NngsListener
	// １行で 1024 byte は飛んでこないことをサーバーと決めておけだぜ☆（＾～＾）
	lineBuffer [1024]byte
	index      uint

	// 状態遷移
	state int

	// 正規表現
	regexCommand regexp.Regexp
}

// Spawn - クライアント接続
func (client NngsClient) Spawn(entryConf c.EntryConf, nngsListener e.NngsListener) error {
	return telnet.DialToAndCall(fmt.Sprintf("%s:%d", entryConf.Nngs.Host, entryConf.Nngs.Port), libraryListener{
		entryConf:    entryConf,
		index:        0,
		nngsListener: nngsListener,
		regexCommand: *regexp.MustCompile("^(\\d+) (.*)")})
}

// CallTELNET - 決まった形のメソッド。
func (lib libraryListener) CallTELNET(ctx telnet.Context, w telnet.Writer, r telnet.Reader) {
	go lib.read(w, r)
	write(w)
}

// 送られてくるメッセージを待ち構えるループです。
func (lib libraryListener) read(w telnet.Writer, r telnet.Reader) {
	var buffer [1]byte // これが満たされるまで待つ。1バイト。
	p := buffer[:]

	for {
		n, err := r.Read(p) // 送られてくる文字がなければ、ここでブロックされます。

		if n > 0 {
			bytes := p[:n]
			lib.lineBuffer[lib.index] = bytes[0]
			lib.index++
			// 改行がない行も届くので、改行が届くまで待つという処理ができません。
			print(string(bytes)) // 受け取るたびに表示。

			// 改行を受け取る前にパースしてしまおう☆（＾～＾）早とちりするかも知れないけど☆（＾～＾）
			lib.parse(w)

			// 行末を判定できるか☆（＾～＾）？
			if bytes[0] == '\n' {
				// print("行末だぜ☆（＾～＾）！")
				lib.index = 0
			}
		}

		if nil != err {
			break // 相手が切断したなどの理由でエラーになるので、終了します。
		}
	}
}

func (lib *libraryListener) parse(w telnet.Writer) {
	// 現在読み取り中の文字なので、早とちりするかも知れないぜ☆（＾～＾）
	line := string(lib.lineBuffer[:lib.index])

	switch lib.state {
	case servstat.None:
		if line == "Login: " {
			// あなたの名前を入力してください。
			user := lib.nngsListener.InputYourName()
			// fmt.Printf("[%s]を入力したいぜ☆（＾～＾）", user)

			// 強制的に名前は入力したことにするぜ☆（＾～＾）空白入れてはダメ☆（＾～＾）
			// if user != "" {
			oi.LongWrite(w, []byte(user))
			oi.LongWrite(w, []byte("\n"))
			//}

			lib.state = servstat.EnteredMyName
		}
	case servstat.EnteredMyName:
		if line == "1 1" {
			// パスワードを入れろだぜ☆（＾～＾）
			if lib.entryConf.Pass() == "" {
				panic("Need password")
			}
			oi.LongWrite(w, []byte(lib.entryConf.Nngs.Pass))
			oi.LongWrite(w, []byte("\n"))
			setClientMode(w)
			lib.state = servstat.EnteredClientMode

		} else if line == "Password: " {
			// パスワードを入れろだぜ☆（＾～＾）
			if lib.entryConf.Pass() == "" {
				panic("Need password")
			}
			oi.LongWrite(w, []byte(lib.entryConf.Nngs.Pass))
			oi.LongWrite(w, []byte("\n"))
			lib.state = servstat.EnteredMyPasswordAndIAmWaitingToBePrompted

		} else if line == "#> " {
			setClientMode(w)
			lib.state = servstat.EnteredClientMode
		}
	case servstat.EnteredMyPasswordAndIAmWaitingToBePrompted:
		if line == "#> " {
			setClientMode(w)
			lib.state = servstat.EnteredClientMode
		}
	case servstat.EnteredClientMode:
		// /^(\d+) (.*)/
		if lib.regexCommand.MatchString(line) {
			// コマンドの形をしていたぜ☆（＾～＾）
			// fmt.Printf("何かコマンドかだぜ☆（＾～＾）？[%s]", line)
		}
	default:
		// 想定外の遷移だぜ☆（＾～＾）！
		panic(fmt.Sprintf("Unexpected state transition. state=%d", lib.state))
	}
}

func setClientMode(w telnet.Writer) {
	oi.LongWrite(w, []byte("set client true\n"))
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
