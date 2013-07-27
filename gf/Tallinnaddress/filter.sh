grep "Tallinna linn" |\
grep "liiklus" |\
cut -f2 -d';' |\
sed -f filter.sed |\
sort |\
uniq
