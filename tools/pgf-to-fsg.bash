#! /bin/bash

# Converts the given PGF to FSG.
#
# Expects the following to be on the PATH:
#  - gf
#  - sed
#  - sphinx_jsgf2fsg
#  - fst* (OpenFst tools)
#
# TODO: do not go through JSGF in order to drop the dependency on sphinx_jsgf2fsg

if [ $# -ne 2 ]
then
	echo "Usage: `basename $0` <pgf> <outdir>"
	exit 1
fi

pgf=$1
outdir=$2

tmpdir=`mktemp -d`

# Convert all concrete grammars to JSGF
gf --make --quiet --output-format=jsgf --output-dir=$tmpdir $pgf

mkdir -p $outdir
for file in $(ls ${tmpdir}/*.jsgf);
do
	# Make JSGF acceptable for sphinx_jsgf2fsg
	sed -i "s/^public //" $file
	sed -i "s/^<MAIN>/public <MAIN>/" $file

	filename=$(basename "$file")
	filename="${filename%.*}"

	# Convert to FSG
	sphinx_jsgf2fsg -jsgf $file -fsm $outdir/${filename}.fsm -symtab $outdir/${filename}.sym 2> $outdir/${filename}.err

	# Optmize the FSG
	fstcompile --arc_type=log --acceptor --isymbols=$outdir/${filename}.sym --keep_isymbols $outdir/${filename}.fsm | fstdeterminize | fstminimize | fstrmepsilon | fstprint > $outdir/${filename}.fsg
done
