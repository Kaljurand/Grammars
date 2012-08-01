make_fun="../tools/make_fun.py"

zip=$(tempfile)

curl http://download.geonames.org/export/dump/EE.zip > ${zip}

unzip -p ${zip} EE.txt | cut -f2,8 | grep PPL | cut -f1 | sort | uniq | python ${make_fun} --lang Est Eeppl

count=$(cat Eeppl.gf | grep "Eeppl__" | wc -l)

echo "Number of places: $count"
