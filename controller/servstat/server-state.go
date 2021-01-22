package servstat

// state
const (
	// None - 開始。
	None = iota
	// EnteredMyName - 自分のアカウント名を入力しました
	EnteredMyName
	// EnteredMyPasswordAndIAmWaitingToBePrompted - 自分のパスワードを入力し、そしてプロンプトを待っています
	EnteredMyPasswordAndIAmWaitingToBePrompted
	// EnteredClientMode - 簡易表示モードに設定しました
	EnteredClientMode
)
