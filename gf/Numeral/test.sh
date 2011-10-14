export GF_LIB_PATH="../lib/"

echo "Testing: App -> ALL"
echo

echo "read_file -file=\"examples/App.txt\" -lines | p -tr -lang=NumeralApp | l | ps -bind" | gf --run Numeral???.gf

echo "Testing: Est -> App"
echo
echo "read_file -file=\"examples/Est.txt\" -lines | p -tr -lang=NumeralEst | l -lang=NumeralApp | ps -unchars" | gf --run Numeral???.gf
