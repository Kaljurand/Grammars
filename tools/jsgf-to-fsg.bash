#! /bin/bash

# Converts the given JSGF to FSG.
# Warning: modified the given JSGF! (TODO: fix this)
#
# Expects the following to be on the PATH:
#  - sed
#  - sphinx_jsgf2fsg
#  - fst* (OpenFst tools)
#
# TODO: do not go through JSGF in order to drop the dependency on sphinx_jsgf2fsg

if [ $# -ne 2 ]
then
	echo "Usage: `basename $0` <jsgf> <outdir>"
	exit 1
fi

jsgf=$1
outdir=$2

# Make JSGF acceptable for sphinx_jsgf2fsg
sed -i "s/^public //" $jsgf
sed -i "s/^<MAIN>/public <MAIN>/" $jsgf

filename=$(basename "$jsgf")
filename="${filename%.*}"

mkdir -p $outdir

# Convert to FSG
sphinx_jsgf2fsg -jsgf $jsgf -fsm $outdir/${filename}.fsm -symtab $outdir/${filename}.sym 2> $outdir/${filename}.err

# Optmize the FSG
fstcompile --arc_type=log --acceptor --isymbols=$outdir/${filename}.sym --keep_isymbols $outdir/${filename}.fsm | fstdeterminize | fstminimize | fstrmepsilon | fstprint > $outdir/${filename}.fsg
