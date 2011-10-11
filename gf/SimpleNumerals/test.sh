path="../lib/:../Numerals/"

echo "Testing: decimal -> ALL"
echo

echo "read_file -file=\"examples/decimal.txt\" -lines | p -tr -lang=decimal | l | ps -bind" | gf --path $path --run decimal.gf estonian.gf

echo "Testing: estonian -> decimal"
echo
echo "read_file -file=\"examples/estonian.txt\" -lines | p -tr -lang=estonian | l -lang=decimal | ps -unchars" | gf --path $path --run decimal.gf estonian.gf
