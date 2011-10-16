echo "Removing automatically generated files..."
ant clean

echo "Testing..."
date
for x in Go Numeral Numerals Unitconv Exp Fraction Calc Address Direction Action Digit Letter Estvrp; do
	echo " $x";
	cd $x;
	sh test.sh > test_out.txt;
	diff test_gold.txt test_out.txt;
	cd ..
done
date
echo "done."
