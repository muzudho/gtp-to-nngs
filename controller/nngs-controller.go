package controller

import (
	"fmt"
)

// NngsController - NNGS からの受信メッセージをさばきます。
type NngsController struct {
	// EntryConf - 参加設定
	EntryConf EntryConf
}

// InputYourName - あなたの名前（アカウント名）を入力してください。
// Only A-Z a-z 0-9
//
// # Returns
//
// NNGSへ送信したい文字列。無ければ空文字を返してください。
func (con NngsController) InputYourName() string {
	// print("ログインきたこれ☆（＾～＾）！")
	return fmt.Sprintf("%s\nset client true", con.EntryConf.User())
}
