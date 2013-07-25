#!/bin/bash

test_out_dir=build/test_out
test_gold_dir=test_gold

# Extracts jsgf- and dict-files from the pgf-files in this directory.
# Compares the extracted files with their previous versions.
# Runs the test.sh-files in the directories that correspond to the pgf-files.
jsgf=jsgf
dict=dict

tools=../tools/

jsgf_langs="Est Eng"
dict_langs="Est"

time_start=`date +%s`
for pgf in *.pgf; do
	name=$(basename "$pgf")
	ext="${name##*.}"
	name="${name%.*}"
	echo "$name";
	dir="${test_out_dir}/${name}"
	mkdir -p $dir
	echo "  $jsgf";
	gf --make --quiet --output-format=${jsgf} --output-dir ${dir} $pgf
	# TODO: delete irrelevant languages
	echo "  $dict";
	for lang in $dict_langs; do
		conc="${dir}/${name}${lang}"
		sh ${tools}/pgf-to-dict.sh ${pgf} ${lang} > ${conc}.${dict}
	done
	if [ -r ${name}/test.sh ]
	then
		echo "  testing";
		cd $name;
		sh test.sh > ../${dir}/${name}.out;
		cd ..
	fi
done
diff -r ${test_gold_dir} ${test_out_dir}
time_end=`date +%s`
time_elapsed=$((time_end - time_start))
echo "Duration: $time_elapsed sec (" $(( time_elapsed / 60 ))m $(( time_elapsed % 60 ))s ")"
