# golangModuleTrial
## 仕様メモ

Go1.11以降では、2つのモードの切り替えのために、環境変数GO111MODULEが用意され、モードの変更ができるようになりました。
```go
$ go env | grep GO111MODULE
GO111MODULE=""
```

|値|説明|
|--|----|
|on または 空|	常にモジュールモードで動作|
|off|常にGOPATHモードで動作|
|auto|$GOPATH/src以下のディレクトリに配置され、<br/>go.modファイルを含まないパッケージはGOPATHモードで、<br/>それ以外はモジュールモードで動作|

##### ※基本的には1リポジトリ＝1モジュール (らしい)
---
## ちょっとやってみる

今回のモジュール名：example.com/trial
<br/>
場所はプロジェクトのルートディレクトリで？
```go
$ go mod init example.com/trial
go: creating new go.mod: module example.com/trial
go: to add module requirements and sums:
        go mod tidy
```
go.mod
```go:go.mod
module example.com/trial

go 1.18
```

パッケージ読み込み先にも必要？わからん<br/>
とりあえずpackagesディレクトリでinit
```
$ cd ./packages
$ go mod init example.com/trial/packages
go: creating new go.mod: module example.com/trial/packages
go: to add module requirements and sums:
        go mod tidy
```


ローカルパッケージ参照するときはgo.modに追記する必要あり<br/>
replace [パッケージ名] => [ローカルプロジェクトのPath(go.modからの相対パス？)]
```diff
module example.com/trial

go 1.18

+ replace example.com/trial/packages => ./packages
```
以下のコマンドでもOK
```
$ go mod edit -replace example.com/trial/packages=./packages
```
