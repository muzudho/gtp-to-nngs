# Install about ruby

## Gtk3 (Windows以外)

Windows でなければ、以下のコマンドを実行してください。  

```shell
gem install gtk3
```

## Gtk3 (Windows)

Windows なら以下の記事を参考にしてください。  

[WindowsでRuby/GTK3を実行する](https://qiita.com/doublev80/items/6b0f623b2e4aa63c4bb6)  

[RubyInstaller / Downloads](https://rubyinstaller.org/downloads/)

例えば `WITHOUT DEVKIT` の `Ruby 2.7.2-1 (x64)` を選びます。  

Windowsなら、 [Windows]キー + [R] から `cmd` でコマンドプロンプトを開いてください。  
以下のコマンドでエラーが出ますが最後まで実行してください。  

```shell
cd C:\Ruby27-x64\bin
gem update --system
gem install rails
gem install gtk3
```
