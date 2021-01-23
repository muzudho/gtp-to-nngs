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

## engine-b-using, engine-w-using は むずでょが練習してるやつ

NNGSサーバーを立てておく。

```shell
cd engine-w-using

ruby nngsCUI.rb
```

別のターミナルを開く。

```shell
cd engine-b-using

ruby nngsCUI.rb
```

## godoc

ドキュメントの作成、閲覧方法。  

```shell
godoc -http=:5555
```

[http://localhost:5555/](http://localhost:5555/)  
