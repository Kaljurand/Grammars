#!/bin/sh

make_fun="../tools/make_fun.py"

if [ $# -ne 2 ]
then
	echo "Usage: `basename $0` <knrfile> <town>"
	exit 1
fi

knr=$1
town=$2
search="${town} linn"

if [ "$town" = "Tallinn" ]
then
	search="Tallinna linn"
fi

# Streets
cat ${knr} |\
grep "${search}" |\
egrep '(liikluspind|kergliiklustee)' |\
cut -f2 -d';' |\
sed -f filter.sed |\
sort |\
uniq |\
python ${make_fun} --lang Est ${town}street


# Places (lakes, bridges, forests, ...)
cat ${knr} |\
grep "${search}" |\
egrep -v '(liikluspind|kergliiklustee)' |\
cut -f2 -d';' |\
egrep -v ' (asum|linnaosa)$' |\
grep -v "${search}" |\
sort |\
uniq |\
python ${make_fun} --lang Est ${town}place
