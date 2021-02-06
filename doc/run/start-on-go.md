# Start

## Go言語に置き換えたろ

NNGSサーバーを立てておく。

```shell
# 実行ファイルを作成するために、以下のコマンドを打鍵してください。
go build
# gtp-to-nngs.exe ファイルが作成されました。

# 実行。
# * `--entry` - 設定ファイルへのパス。省略したなら `./input/default.entryConf.toml`
gtp-to-nngs --entry ./input/default.entryConf.toml

# 後手プレイヤーにするかどうかは、設定ファイルに書いてください。
gtp-to-nngs --entry ./input/kifuwarabi.entryConf.toml
```

## godoc

ドキュメントの作成、閲覧方法。  

```shell
godoc -http=localhost:6060
```

[http://localhost:5555/](http://localhost:6060/)  
