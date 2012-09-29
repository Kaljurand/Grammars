path="lib:Address:Alarm:Calc:Date:Digit:Direction:Eeppl:Expr:Fraction:Letter:Numeral:Tallinnaddress:Unitconv"
of=jsgf
dict=dict

echo "Removing automatically generated files..."
ant clean

echo "Testing..."
date
for x in Alarm Date Go Numeral Unitconv Expr Fraction Calc Address Direction Action Digit Letter Estvrp Tallinnaddress Tallinndirection; do
	echo " $x";
	echo "   ${of}";
	gf --make --quiet --optimize-pgf --output-format=${of} --path $path --output-dir $x $x/${x}{Est,Eng}.gf
	diff $x/${of}/${x}Est.${of} $x/${x}Est.${of}
	diff $x/${of}/${x}Eng.${of} $x/${x}Eng.${of}
	echo "   dict";
	cat $x/${x}Est.${of} | sh ../tools/jsgf-to-dict.sh > $x/${x}Est.${dict}
	echo "   test";
	cd $x;
	sh test.sh > test_out.txt;
	diff test_gold.txt test_out.txt;
	cd ..
done
date
echo "done."
