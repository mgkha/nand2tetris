package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

func check(err error) {
	if err != nil {
		panic(err)
	}
}

func main() {
	inputFileName := os.Args[1]
	outputFilename := strings.TrimSuffix(inputFileName, filepath.Ext(inputFileName)) + ".asm"

	className := strings.TrimSuffix(filepath.Base(inputFileName), filepath.Ext(inputFileName))

	inFile, err := os.Open(inputFileName)
	check(err)
	defer inFile.Close()
	reader := bufio.NewReader(inFile)

	outFile, err := os.Create(outputFilename)
	check(err)
	defer outFile.Close()
	writer := bufio.NewWriter(outFile)

	InitParser(reader)
	InitCodeWriter(writer, className)

	for HasMoreLines() {
		Advance()

		index, _ := strconv.Atoi(Arg2())

		if CommandType() == C_PUSH || CommandType() == C_POP {
			WritePushPop(CommandType().String(), Arg1(), index)
		} else if CommandType() == C_ARITHMETIC {
			WriteArithmetic(Arg1())
		}
	}
	writer.Flush()
	fmt.Println("Compilation succeed!")
}
