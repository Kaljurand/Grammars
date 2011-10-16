path="lib:Address:Calc:Digit:Direction:Eeppl:Exp:Fraction:Letter:Numerals:Unitconv"

# TODO: this script assumes that the languages are always called Est and App.
# This is needed for "gr -lang". If we do not specify lang then we
# can get trees which cannot be linearized, e.g. in Calc we would get
# an expression for which the Est linearization contains brackets.
# BUG: actually specifying -lang didn't solve this problem.

build=build
dir_gr=${build}/gr/
dir_pgf=${build}/pgf/

echo "Making output directories"
mkdir -p ${dir_gr}
mkdir -p ${dir_pgf}

echo "Building PGF files..."
for grammar in Action Address Calc Digit Direction Estvrp Exp Fraction Go Letter Symbols Unitconv; do
	echo "  $grammar";
	echo "    PGF";
	gf -s --make --optimize-pgf --mk-index --path $path --output-dir ${dir_pgf} ${grammar}/${grammar}???.gf
	echo "    gr";
	echo "gr -lang=${grammar}Est,${grammar}App -number=50 -depth=5 | l -list -bind" | gf --run ${grammar}.pgf > ${dir_gr}/${grammar}.txt
done
echo "done."
