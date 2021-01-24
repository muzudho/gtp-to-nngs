package clistat

// Clistat - Client state. NNGSサーバーでゲームをしているクライアントの状態遷移。
type Clistat int

// state
const (
	// None - 開始。
	None Clistat = iota
	// EnteredMyName - 自分のアカウント名を入力しました
	EnteredMyName
	// EnteredMyPasswordAndIAmWaitingToBePrompted - 自分のパスワードを入力し、そしてプロンプトを待っています
	EnteredMyPasswordAndIAmWaitingToBePrompted
	// EnteredClientMode - 簡易表示モードに設定しました
	EnteredClientMode
	// WaitingInTheLobby - 対局が申し込まれるのをロビーで待ちます
	WaitingInTheLobby
	// ItIsMyTurn - 自分に手番が回ってきました
	ItIsMyTurn
	// ItIsOpponentTurn - 相手に手番を回しました
	ItIsOpponentTurn
)
