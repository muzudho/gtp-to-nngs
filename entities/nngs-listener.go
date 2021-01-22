package entities

// NngsListener - NNGS からの受信メッセージをさばきます。
type NngsListener interface {
	// InputYourName - あなたの名前（アカウント名）を入力してください。
	// Only A-Z a-z 0-9
	// Names may be at most 10 characters long
	//
	// # Returns
	//
	// NNGSへ送信したい文字列。無ければ空文字を返してください。
	InputYourName() string
}
