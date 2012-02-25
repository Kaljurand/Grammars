path="../lib/"

echo "Testing: App -> ALL"
echo

cat examples/App.txt | sed "s/^/p -lang=NumeralApp \"/" | sed 's/$/" | l -bind/' | gf --run --path $path Numeral???.gf

echo "Testing: Est -> App"
echo

cat examples/Est.txt | sed "s/^/p -tr -lang=NumeralEst \"/" | sed 's/$/" | l -lang=NumeralApp -bind/' | gf --run --path $path Numeral???.gf
