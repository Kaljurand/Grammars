#!/bin/sh

if [ $# -ne 2 ]
then
	echo "Usage: pgf-to-dict.sh <pgf> <lang>"
	exit
fi

pgf=$1
lang=$2

echo "print_grammar -lang=${lang} -words" | gf --quiet --run ${pgf} | tr ' ' '\012' | sort | uniq | `dirname $0`/words-to-dict.sh $lang
