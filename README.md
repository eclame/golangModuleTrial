# golangModuleTrial

Go1.11以降では、2つのモードの切り替えのために、環境変数GO111MODULEが用意され、モードの変更ができるようになりました。

$ go env | grep GO111MODULE
GO111MODULE=""

値	説明
on または 空	常にモジュールモードで動作
off	常にGOPATHモードで動作
auto	$GOPATH/src以下のディレクトリに配置され、go.modファイルを含まないパッケージはGOPATHモードで、それ以外はモジュールモードで動作

基本的には1リポジトリ＝1モジュール

go mod init example.com/trial
go: creating new go.mod: module example.com/trial
go: to add module requirements and sums:
        go mod tidy

module example.com/trial

go 1.18

