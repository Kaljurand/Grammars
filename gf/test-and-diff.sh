#!/bin/bash

# Extracts jsgf- and dict-files from the given pgf-files
# and/or compares the extracted files with their (previous) versions
# in the given directory.
# Also, runs the test.sh-files in the directories that correspond to the pgf-files
# (if they exist).

test_out_dir=
test_gold_dir=

# Reset in case getopts has been used previously in the shell.
OPTIND=1

function show_help {
    echo "Usage examples:

Compare the two given directories, ignoring certain files which
contain machine-only code.

    ./test-and-diff.sh -f build/test_out/ -g test_gold/

Generate various outputs into the given directory based on the given PGF-files.

    ./test-and-diff.sh -f build/test_out/ build/pgf/*.pgf
"
}

while getopts "h?f:g:" opt; do
    case "$opt" in
    h|\?)
        # TODO: define it
        show_help
        exit 0
        ;;
    f)  test_out_dir=$OPTARG
        ;;
    g)  test_gold_dir=$OPTARG
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

path="${GF_EST_SRC}/estonian:../lib:../Address:../Alarm:../ArithExpr:../Calc:../Date:../Dial:../Digit:../Direction:../Eeppl:../Expr:../Fraction:../Letter:../Number:../Tallinnaddress:../Unitconv:../Weather"

jsgf=jsgf
dict=dict

tools=../tools/

jsgf_langs="Eng Est"
dict_langs="Est"

time_start=`date +%s`
for pgf in "$@"; do
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
		sh test.sh ${path} > ../${dir}/${name}.out;
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

if [ -n "${test_gold_dir}" ]
then
    diff -r -x *.fsm -x *.fsg -x *.sym ${test_gold_dir} ${test_out_dir}
fi

time_end=`date +%s`
time_elapsed=$((time_end - time_start))
echo "Duration: $time_elapsed sec (" $(( time_elapsed / 60 ))m $(( time_elapsed % 60 ))s ")"
