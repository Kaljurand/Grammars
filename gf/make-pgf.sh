path="lib:Address:Calc:Digit:Direction:Exp:Fraction:Letter:Numerals:Unitconv"

echo "Building PGF files..."
for grammar in Action Address Calc Digit Direction Estvrp Exp Fraction Go Letter Symbols Unitconv; do
	echo " $grammar";
	gf -s --make --optimize-pgf --mk-index --path $path ${grammar}/${grammar}???.gf
done
echo "done."
