#!/bin/bash

# Assumes env variable GF_UTILS and that it is on the PATH

if [ $# -ne 3 ]
then
	echo "Usage: generate.bash <pgf> <cats> <out>"
	exit
fi

g=$1
cats=$2
out=$3

# Max number of partial trees per function per category
max_ptrees=2

# Disambiguation language
lang=App

# Generation depth
depth=5

# Probabilities
probs=/dev/null

# How many trees to generate
number=3

# How many times to repeat generation
# Values higher than 1 might makse sense is timeout is used.
repeat=1

# Timeout in seconds
timeout=1

# Locations of various outputs
ptrees_suffix=ptrees.txt
funs=${out}/funs.pl
allptrees=${out}/allptrees.txt
trees=${out}/trees.txt
coverage_ptrees=${out}/coverage_ptrees.txt
coverage_trees=${out}/coverage_trees.txt
coverage_ptrees_sorted=${out}/coverage_ptrees_sorted.txt
coverage_trees_sorted=${out}/coverage_trees_sorted.txt
coverage_ptrees_info=${out}/coverage_ptrees_info.txt
coverage_trees_info=${out}/coverage_trees_info.txt
lincmd=${out}/lincmd.txt
lin=${out}/lin.txt
lin_lang=${out}/lin_App.txt

mkdir -p ${out}

echo "Making the list of function definitions"
echo "pg -funs" | gf --run ${g} | convert_funs.py > ${funs}

for cat in ${cats}; do
	echo "Generating partial trees up to category ${cat}";
	swipl -g "['${funs}'], ['${GF_UTILS}/fun_path'], find_filter_and_format_trees(${max_ptrees}, '${cat}')." -t halt -f none > ${out}/cat_${cat}_${ptrees_suffix}
done

cat ${out}/cat_*_${ptrees_suffix} > ${allptrees}

echo "Filling in partial trees"
cat ${allptrees} | generate.py --lang=${lang} --depth ${depth} --number ${number} --repeat ${repeat} --timeout=${timeout} --probs ${probs} -g ${g} | sort | uniq > ${trees}

echo "Making a GF linearize-command"
cat ${trees} | egrep -v "^[[:space:]]*$" | sed "s/^/l -bind -treebank /" > ${lincmd}

echo "Coverage of partial and final trees"
cat ${allptrees} | coverage.py -g ${g} > ${coverage_ptrees} 2> ${coverage_ptrees_info}
cat ${trees} | coverage.py -g ${g} > ${coverage_trees} 2> ${coverage_trees_info}
cat ${coverage_ptrees_info} ${coverage_trees_info}

cat ${coverage_ptrees} | sort -nr -k3 > ${coverage_ptrees_sorted}
cat ${coverage_trees} | sort -nr -k3 > ${coverage_trees_sorted}

echo "Linearizing"
cat ${lincmd} | gf --run ${g} > ${lin}

echo "Extracting final linearizations"
cat ${lin} | egrep "(App|Est|Eng): " | perl -pe 's/(.*App: )/\n$1/' > ${lin_lang}
