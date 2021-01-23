package main

import (
	"flag"
	"fmt"

	c "github.com/muzudho/gtp-to-nngs/controller"
	"github.com/muzudho/gtp-to-nngs/gateway"
	"github.com/muzudho/gtp-to-nngs/ui"
)

func main() {
	// コマンドライン引数
	entryConfPath := flag.String("entry", "./input/default.entryConf.toml", "*.entryConf.toml file path.")
	flag.Parse()
	fmt.Println(flag.Args())
	// fmt.Printf("entryConfPath=%s", *entryConfPath)

	// fmt.Println("設定ファイルを読み込んだろ☆（＾～＾）")
	entryConf := ui.LoadEntryConf(*entryConfPath) // "./input/default.entryConf.toml"

	// NNGSからのメッセージ受信に対応するプログラムを指定したろ☆（＾～＾）
	nngsController := c.NngsController{EntryConf: entryConf}

	fmt.Println("(^q^) 何か文字を打てだぜ☆ 終わりたかったら [Ctrl]+[C]☆")
	nngsClient := gateway.NngsClient{}
	nngsClient.Spawn(entryConf, nngsController)
	fmt.Println("(^q^) おわり☆！")
}
