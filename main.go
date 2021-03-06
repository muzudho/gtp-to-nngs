package main

import (
	"flag"
	"fmt"
	"os/exec"
	"strings"

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

	// グローバル変数の作成
	e.G = *new(e.GlobalVariables)

	// ロガーの作成。
	e.G.Log = *e.NewLogger(
		"output/trace.log",
		"output/debug.log",
		"output/info.log",
		"output/notice.log",
		"output/warn.log",
		"output/error.log",
		"output/fatal.log",
		"output/print.log")

	// チャッターの作成。 標準出力とロガーを一緒にしただけです。
	e.G.Chat = *e.NewChatter(e.G.Log)

	// 標準出力への表示と、ログへの書き込みを同時に行います。
	//e.G.Chat.Trace("Author: %s\n", e.Author)

	// fmt.Println("設定ファイルを読み込んだろ☆（＾～＾）")
	entryConf := ui.LoadEntryConf(*entryConfPath) // "./input/default.entryConf.toml"

	// NNGSからのメッセージ受信に対応するプログラムを指定したろ☆（＾～＾）
	var nngsController e.NngsListener = nil
	fmt.Printf("(^q^) プレイヤーのタイプ☆ [%s]", entryConf.Nngs.PlayerType)
	switch entryConf.Nngs.PlayerType {
	case "Human":
		nngsController = c.NngsHumanController{EntryConf: entryConf}
	case "GTP":
		// 引数を半角スペース区切り
		parameters := strings.Split(entryConf.Nngs.EngineCommandOption, " ")
		fmt.Printf("(^q^) GTP対応の思考エンジンを起動するぜ☆ [%s] [%s]", entryConf.Nngs.EngineCommand, strings.Join(parameters, " "))

		cmd := exec.Command(entryConf.Nngs.EngineCommand, parameters...)
		err := cmd.Start()
		if err != nil {
			panic(err)
		}
		nngsController = c.NngsGtpController{EntryConf: entryConf}
	default:
		panic(fmt.Sprintf("Unexpected PlayerType=[%s].", entryConf.Nngs.PlayerType))
	}

	fmt.Println("(^q^) 何か文字を打てだぜ☆ 終わりたかったら [Ctrl]+[C]☆")
	nngsClient := gateway.NngsClient{}
	nngsClient.Spawn(entryConf, nngsController)
	fmt.Println("(^q^) おわり☆！")
}
