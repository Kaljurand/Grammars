#!/bin/bash

path="lib:Address:Alarm:Calc:Date:Dial:Digit:Direction:Eeppl:Expr:Fraction:Letter:Numeral:Tallinnaddress:Unitconv:Weather"

build=build
dir_gr=${build}/gr/
dir_pgf=${build}/pgf/

echo "Making output directories"
mkdir -p ${dir_gr}
mkdir -p ${dir_pgf}

grammars=(Action Alarm Calc Dial Digit Direction Estvrp Expr Go Letter Symbols Tallinndirection Unitconv Unitconvext Weather)

echo "Building PGF files..."
for grammar in "${grammars[@]}"; do
	files=`ls -m ${grammar}/${grammar}*.gf`;
	echo "  ${grammar}: $files";
	echo "    PGF";
	# TODO: does --mk-index have any effect? (it seems to generate the same file)
	gf -s --make --optimize-pgf --mk-index --path $path --output-dir ${dir_pgf} ${grammar}/${grammar}*.gf
	echo "    generate";
	# TODO: This requires GF-Utils, skip if they do not exist
	bash generate.bash ${grammar}.pgf ${grammar} ${dir_gr}/${grammar}
done
echo "done."
