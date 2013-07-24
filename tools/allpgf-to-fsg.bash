#! /bin/bash

# Converts all PGF files in the given directory to FSG.
#
# Expects the following to be on the PATH:
#  - gf
#  - sed
#  - sphinx_jsgf2fsg
#  - fst* (OpenFst tools)

if [ $# -ne 2 ]
then
	echo "Usage: `basename $0` <pgfdir> <outdir>"
	exit 1
fi

pgfdir=$1
outdir=$2

for pgf in $(ls ${pgfdir}/*.pgf);
do
	echo "Processing $pgf"
	time `dirname $0`/pgf-to-fsg.bash $pgf $outdir
	echo
done

wc -l $outdir/*.fsg | sort -nr
