package main

import (
	"fmt"

	c "github.com/muzudho/gtp-to-nngs/controller"
	e "github.com/muzudho/gtp-to-nngs/entities"
	"github.com/muzudho/gtp-to-nngs/ui"
)

func main() {
	// fmt.Println("設定ファイルを読み込んだろ☆（＾～＾）")
	entryConf := ui.LoadEntryConf("./input/default.entryConf.toml")

	// NNGSからのメッセージ受信に対応するプログラムを指定したろ☆（＾～＾）
	nngsListener := e.NngsListener{}

	fmt.Println("(^q^) 何か文字を打てだぜ☆ 終わりたかったら [Ctrl]+[C]☆")
	client := c.Client{}
	client.Spawn(entryConf, nngsListener)
	fmt.Println("(^q^) おわり☆！")
}
