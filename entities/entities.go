package entities

// ColumnAlphabetToNumber - 列アルファベットを数に変換します。 I列 を省いた数にします。
// TODO あとで byte型に変えよ☆（＾～＾）
func ColumnAlphabetToNumber(move string) int {

	columnNumber := move[0] - string("A")[0] + 1
	if string("I")[0]-string("A")[0] < columnNumber {
		// I列 の分を引きます。
		columnNumber = columnNumber - 1
	}

	return int(columnNumber)
}
