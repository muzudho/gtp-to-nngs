package controller

// Config - 設定。
type Config struct {
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
func (config Config) Host() string {
	return config.Nngs.Host
}

// Port - 接続先ホストのポート番号
func (config Config) Port() uint {
	return uint(config.Nngs.Port)
}

// User - 対局者名（アカウント名）
func (config Config) User() string {
	return config.Nngs.User
}

// Pass - 何路盤
func (config Config) Pass() string {
	return config.Nngs.Pass
}

// Phase - 何路盤
func (config Config) Phase() string {
	return config.MatchApplication.Phase
}

// BoardSize - 何路盤
func (config Config) BoardSize() uint {
	return uint(config.MatchApplication.BoardSize)
}

// AvailableTimeMinutes - 持ち時間（分）
func (config Config) AvailableTimeMinutes() uint {
	return uint(config.MatchApplication.AvailableTimeMinutes)
}

// CanadianTiming - カナダ式秒読み。25手を何分以内に打てばよいか
func (config Config) CanadianTiming() uint {
	return uint(config.MatchApplication.CanadianTiming)
}
