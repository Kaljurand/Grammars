# See: https://github.com/alumae/et-g2p
et_g2p=${HOME}/myapps/et-g2p/

if [ $# -ne 2 ]
then
	echo "Usage: sh pgf-to-dict.sh <pgf> <lang>"
	exit
fi

pgf=$1
lang=$2

echo "print_grammar -lang=${lang} -words" | gf --quiet --run ${pgf} | tr ' ' '\012' | sort | uniq | $et_g2p/run.sh
