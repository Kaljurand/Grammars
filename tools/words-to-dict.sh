#!/bin/sh

if [ $# -ne 1 ]
then
	echo "Usage: `basename $0` <lang>"
	exit
fi

. `dirname $0`/settings.sh

lang=$1

if [ $lang = "Est" ]
then
	$et_g2p/run.sh
elif [ $lang = "Eng" ]
then
	`dirname $0`/lookup-phon.py --dict $dict
else
	echo "Error: language $lang not supported"
fi
