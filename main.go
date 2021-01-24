package main

import (
	"flag"
	"fmt"

	e "github.com/muzudho/gtp-to-nngs/entities"

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
	var nngsController e.NngsListener = nil
	switch entryConf.Nngs.PlayerType {
	case "Human":
		nngsController = c.NngsHumanController{EntryConf: entryConf}
	case "GTP":
		nngsController = c.NngsGtpController{EntryConf: entryConf}
	default:
		panic(fmt.Sprintf("Unexpected PlayerType=[%s].", entryConf.Nngs.PlayerType))
	}

	fmt.Println("(^q^) 何か文字を打てだぜ☆ 終わりたかったら [Ctrl]+[C]☆")
	nngsClient := gateway.NngsClient{}
	nngsClient.Spawn(entryConf, nngsController)
	fmt.Println("(^q^) おわり☆！")
}
