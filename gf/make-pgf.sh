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
	echo "    gr";
	# TODO: how to make sure that the trees can be linearized in all the languages?
	#echo "gr -lang=${grammar}Est,${grammar}App -number=50 -depth=5 | l -treebank -bind" | gf --run ${grammar}.pgf > ${dir_gr}/${grammar}.txt
	echo "gr -number=50 -depth=5 | l -treebank -bind" | gf --run ${grammar}.pgf > ${dir_gr}/${grammar}.txt
done
echo "done."
