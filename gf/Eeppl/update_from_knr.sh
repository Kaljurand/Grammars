make_fun="../tools/make_fun.py"

#TODO: use: csvtool -t ";" -u ";" col 2,6 - |\

cut -f2,6 -d';' |\
egrep ';(linn|linnaosa|vallasisene linn|alev|alevik|küla|väikekoht)$' |\
cut -f1 -d';' |\
sed -f changes_knr.sed |\
sort |\
uniq |\
python ${make_fun} --lang Est Eeppl

count=$(cat Eeppl.gf | grep "Eeppl__" | wc -l)

echo "Number of place names: $count"
