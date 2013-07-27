grep "Tallinna linn" |\
grep -v "liiklus" |\
cut -f2 -d';' |\
grep -v "linnaosa" |\
grep -v "Tallinna linn" |\
sort |\
uniq
