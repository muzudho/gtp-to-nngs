package main

import (
	"fmt"

	"github.com/muzudho/gtp-to-nngs/controller"
)

func main() {
	// fmt.Println("設定ファイルを読み込んだろ☆（＾～＾）")
	controller.LoadEntryConf("./input/default.entryConf.toml")

	fmt.Println("(^q^) 何か文字を打てだぜ☆ 終わりたかったら [Ctrl]+[C]☆")
	startClient()
	fmt.Println("(^q^) おわり☆！")
}
