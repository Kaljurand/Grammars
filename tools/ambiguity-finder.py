#! /usr/bin/env python

# Usage:
#
# cat Action/dict/ActionEst.dict | python ambiguity-finder.py | sort -nr

import sys
import argparse

def index():
	phons = {}
	for line in sys.stdin:
		cols = line.strip().split('\t')
		if len(cols) == 2:
			word = cols[0]
			phon = cols[1]
			if phon in phons:
				phons[phon].append(word)
			else:
				phons[phon] = [word]
		else:
			print >> sys.stderr, "Syntax error: {0}".format(cols)
	return phons


def print_index(phons):
	for key in phons.keys():
		print '{0}\t{1}\t{2}'.format(len(phons[key]), key, ', '.join(phons[key]))


parser = argparse.ArgumentParser(description='Ambiguity finder in dict-files')
parser.add_argument('-v', '--version', action='version', version='%(prog)s v0.1')
args = parser.parse_args()

print_index(index())
