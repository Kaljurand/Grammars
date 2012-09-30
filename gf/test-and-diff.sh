# Extracts jsgf- and dict-files from the pgf-files in this directory.
# Compares the extracted files with their previous versions.
# Runs the test.sh-files in the directories that correspond to the pgf-files.
of=jsgf
dict=dict

jsgf_langs="Est Eng"
dict_langs="Est"

date
for pgf in *.pgf; do
	name=$(basename "$pgf")
	ext="${name##*.}"
	name="${name%.*}"
	echo " $name";
	echo "   ${of}";
	gf --make --quiet --output-format=${of} --output-dir $name $pgf
	for lang in $jsgf_langs; do
		conc=${name}/${name}${lang}
		diff $name/${of}/${name}${lang}.${of} ${conc}.${of}
	done
	for lang in $dict_langs; do
		conc=${name}/${name}${lang}
		cat ${conc}.${of} | sh ../tools/jsgf-to-dict.sh $lang > ${conc}.${dict}
		diff $name/${dict}/${name}${lang}.${dict} ${conc}.${dict}
	done
	cd $name;
	sh test.sh > test_out.txt;
	diff test_gold.txt test_out.txt;
	cd ..
done
date
echo "done."
