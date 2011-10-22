path="../lib/"

echo "Testing: App -> ALL"
echo

cat examples/App.txt | sed "s/^/p -tr -lang=NumeralApp \"/" | sed 's/$/" | l | ps -bind/' | gf --run --path $path Numeral???.gf

echo "Testing: Est -> App"
echo

cat examples/Est.txt | sed "s/^/p -tr -lang=NumeralEst \"/" | sed 's/$/" | l -lang=NumeralApp | ps -bind/' | gf --run --path $path Numeral???.gf
