path="../lib/"

echo "Testing: App -> ALL"
echo

cat examples/App.txt | sed "s/^/p -lang=NumberApp \"/" | sed 's/$/" | l -bind/' | gf --run --path $path Number???.gf

echo "Testing: Est -> App"
echo

cat examples/Est.txt | sed "s/^/p -tr -lang=NumberEst \"/" | sed 's/$/" | l -lang=NumberApp -bind/' | gf --run --path $path Number???.gf
