#!/bin/bash

# gsl: Nuance GSL speech recognition grammar
# jsgf: Java Speech Grammar Format (JSGF)
# - jsgf_sisr_old: JSGF with semantic tags in SISR WD 20030401 format
# srgs_abnf: SRGS ABNF format
# srgs_xml: SRGS XML format
# - srgs_xml_prob: SRGS XML format, with weights
# slf: finite automaton in the HTK SLF format
# - slf_sub: finite automaton with sub-automata in HTK SLF

fmts="gsl jsgf srgs_abnf srgs_xml slf"

echo "Building PGF..."
gf --make --optimize-pgf --mk-index CopyC?.gf

echo "Generating speech recognition grammars...";
for f in $fmts; do
	gf --make --output-format=$f Copy.pgf
done
