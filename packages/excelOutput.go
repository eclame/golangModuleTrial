package packages

import (
	"fmt"

	"github.com/360EntSecGroup-Skylar/excelize"
)

func SampleExcelExport() {
	f := excelize.NewFile()

	if err := f.SaveAs("サンプル.xlsx"); err != nil {
		fmt.Println(err)
	}
}
