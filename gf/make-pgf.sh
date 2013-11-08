#!/bin/bash

path="${GF_EST_SRC}/estonian:lib:Address:Alarm:ArithExpr:Calc:Date:Dial:Digit:Direction:Eeppl:Expr:Fraction:Letter:Number:Tallinnaddress:Unitconv:Weather"

build=build
dir_gr=${build}/gr/
dir_pgf=${build}/pgf/

echo "Making output directories"
mkdir -p ${dir_gr}
mkdir -p ${dir_pgf}

grammars=(Action Address Alarm ArithExpr Calc Dial Digit Direction Estvrp Expr Go Letter Symbols Tallinndirection Unitconv Weather)

echo "Building PGF files..."
for grammar in "${grammars[@]}"; do
	echo "  ${grammar}: $listing";
	echo "    PGF";
	# TODO: does --mk-index have any effect? (it seems to generate the same file)
	listing=$(find ${grammar} -name "*.gf" | egrep "${grammar}...(tts)?\.gf" | tr '\n' ' ')
	gf -s --make --optimize-pgf --mk-index --path $path --output-dir ${dir_pgf} ${listing}
	#echo "    generate";
	# TODO: This requires GF-Utils, skip if they do not exist
	#bash generate.bash ${grammar}.pgf ${grammar} ${dir_gr}/${grammar}
done
echo "done."
