package controller

import (
	"io/ioutil"

	e "github.com/muzudho/kifuwarabe-uec12/entities"
	"github.com/pelletier/go-toml"
)

// Config - Tomlファイル。
type Config struct {
	Nngs             Nngs
	MatchApplication MatchApplication
}

// Nngs - [Nngs] テーブル。
type Nngs struct {
	Host string
	Port int64 // Tomlのライブラリーが精度を細かく指定できないので int64 型で。
	User string
	Pass string
}

// MatchApplication - [MatchApplication] テーブル。
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

// LoadEntryConf - 参加設定ファイルを読み込みます。
func LoadEntryConf(path string) Config {

	// ファイル読込
	fileData, err := ioutil.ReadFile(path)
	if err != nil {
		e.G.Chat.Fatal("path=%s", path)
		panic(err)
	}

	/*
		fmt.Print(string(fileData))
		tomlTree, err := toml.Load(string(fileData))
		if err != nil {
			panic(err)
		}
		fmt.Println("Input:")
		fmt.Printf("Nngs.Host=%s\n", tomlTree.Get("Nngs.Host").(string))
		fmt.Printf("Nngs.Port=%d\n", tomlTree.Get("Nngs.Port").(int64))
		fmt.Printf("Nngs.User=%s\n", tomlTree.Get("Nngs.User").(string))
		fmt.Printf("Nngs.Pass=%s\n", tomlTree.Get("Nngs.Pass").(string))
		fmt.Printf("MatchApplication.Phase=%s\n", tomlTree.Get("MatchApplication.Phase").(string))
		fmt.Printf("MatchApplication.BoardSize=%d\n", tomlTree.Get("MatchApplication.BoardSize").(int64))
		fmt.Printf("MatchApplication.AvailableTimeMinutes=%d\n", tomlTree.Get("MatchApplication.AvailableTimeMinutes").(int64))
		fmt.Printf("MatchApplication.CanadianTiming=%d\n", tomlTree.Get("MatchApplication.CanadianTiming").(int64))
	*/

	// Toml解析
	binary := []byte(string(fileData))
	config := Config{}
	toml.Unmarshal(binary, &config)

	/*
		fmt.Println("Memory:")
		fmt.Println("Nngs.Host=", config.Nngs.Host)
		fmt.Println("Nngs.Port=", config.Nngs.Port)
		fmt.Println("Nngs.User=", config.Nngs.User)
		fmt.Println("Nngs.Pass=", config.Nngs.Pass)
		fmt.Println("MatchApplication.Phase=", config.MatchApplication.Phase)
		fmt.Println("MatchApplication.BoardSize=", config.MatchApplication.BoardSize)
		fmt.Println("MatchApplication.AvailableTimeMinutes=", config.MatchApplication.AvailableTimeMinutes)
		fmt.Println("MatchApplication.CanadianTiming=", config.MatchApplication.CanadianTiming)
	*/

	return config
}
