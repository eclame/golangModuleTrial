module example.com/trial

go 1.18

replace example.com/trial/packages => ./packages

require example.com/trial/packages v0.0.0-00010101000000-000000000000

require (
	github.com/360EntSecGroup-Skylar/excelize v1.4.1 // indirect
	github.com/mohae/deepcopy v0.0.0-20170929034955-c48cc78d4826 // indirect
)
