package servstat

// NngsClientState - NNGSサーバーでゲームをしているクライアントの状態遷移。
type NngsClientState int

// state
const (
	// None - 開始。
	None NngsClientState = iota
	// EnteredMyName - 自分のアカウント名を入力しました
	EnteredMyName
	// EnteredMyPasswordAndIAmWaitingToBePrompted - 自分のパスワードを入力し、そしてプロンプトを待っています
	EnteredMyPasswordAndIAmWaitingToBePrompted
	// EnteredClientMode - 簡易表示モードに設定しました
	EnteredClientMode
	// WaitingInTheLobby - 対局が申し込まれるのをロビーで待ちます
	WaitingInTheLobby
)
