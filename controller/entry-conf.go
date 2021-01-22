package controller

// EntryConf - 参加設定。
type EntryConf struct {
	Nngs             Nngs
	MatchApplication MatchApplication
}

// Nngs - [Nngs] 区画。
type Nngs struct {
	Host string
	Port int64 // Tomlのライブラリーが精度を細かく指定できないので int64 型で。
	User string
	Pass string
}

// MatchApplication - [MatchApplication] 区画。
type MatchApplication struct {
	Phase                string
	BoardSize            int64
	AvailableTimeMinutes int64
	CanadianTiming       int64
}

// Host - 接続先ホスト名
func (config EntryConf) Host() string {
	return config.Nngs.Host
}

// Port - 接続先ホストのポート番号
func (config EntryConf) Port() uint {
	return uint(config.Nngs.Port)
}

// User - 対局者名（アカウント名）
func (config EntryConf) User() string {
	return config.Nngs.User
}

// Pass - 何路盤
func (config EntryConf) Pass() string {
	return config.Nngs.Pass
}

// Phase - 何路盤
func (config EntryConf) Phase() string {
	return config.MatchApplication.Phase
}

// BoardSize - 何路盤
func (config EntryConf) BoardSize() uint {
	return uint(config.MatchApplication.BoardSize)
}

// AvailableTimeMinutes - 持ち時間（分）
func (config EntryConf) AvailableTimeMinutes() uint {
	return uint(config.MatchApplication.AvailableTimeMinutes)
}

// CanadianTiming - カナダ式秒読み。25手を何分以内に打てばよいか
func (config EntryConf) CanadianTiming() uint {
	return uint(config.MatchApplication.CanadianTiming)
}
