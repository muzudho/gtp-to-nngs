package main

import (
	"fmt"

	c "github.com/muzudho/gtp-to-nngs/controller"
	"github.com/muzudho/gtp-to-nngs/ui"
)

func main() {
	// fmt.Println("設定ファイルを読み込んだろ☆（＾～＾）")
	entryConf := ui.LoadEntryConf("./input/default.entryConf.toml")

	fmt.Println("(^q^) 何か文字を打てだぜ☆ 終わりたかったら [Ctrl]+[C]☆")
	client := c.Client{}
	client.Spawn(entryConf)
	fmt.Println("(^q^) おわり☆！")
}
