# Usage:
# cat tallinn3.htm  | sh filter.sh

grep "<br>" |\
sed -f filter.sed |\
sort |\
uniq
