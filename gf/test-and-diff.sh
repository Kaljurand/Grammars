#!/bin/bash

test_out_dir=build/test_out
test_gold_dir=test_gold

# Extracts jsgf- and dict-files from the pgf-files in this directory.
# Compares the extracted files with their previous versions.
# Runs the test.sh-files in the directories that correspond to the pgf-files.
jsgf=jsgf
dict=dict

tools=../tools/

jsgf_langs="Eng Est"
dict_langs="Est"

rm -r ${test_out_dir}

time_start=`date +%s`
for pgf in *.pgf; do
	name=$(basename "$pgf")
	ext="${name##*.}"
	name="${name%.*}"
	echo "$name";
	dir="${test_out_dir}/${name}"
	mkdir -p $dir
	report="${dir}/${name}.report"

	# TODO: do not create JSGF for irrelevant languages
	echo "  $jsgf";
	/usr/bin/time -f'PGF->JSGF: %E' -a -o ${report} gf --make --quiet --output-format=${jsgf} --output-dir ${dir} $pgf

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

	echo "  fsg";
	for lang in $jsgf_langs; do
		conc="${dir}/${name}${lang}"
		concjsgf="${dir}/${name}${lang}.jsgf"
		if [ -r ${concjsgf} ]
		then
			/usr/bin/time -f'%E' -a -o ${report} ${tools}/jsgf-to-fsg.bash ${concjsgf} $dir
			wc -l ${conc}.fsg >> ${report}
		fi
	done
done
diff -r -x *.fsm -x *.fsg -x *.sym ${test_gold_dir} ${test_out_dir}
time_end=`date +%s`
time_elapsed=$((time_end - time_start))
echo "Duration: $time_elapsed sec (" $(( time_elapsed / 60 ))m $(( time_elapsed % 60 ))s ")"
