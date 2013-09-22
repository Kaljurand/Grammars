#! /usr/bin/env python

# Author: Kaarel Kaljurand
# Version: 2013-09-22
#
import argparse
import re
import sys

def get_word_to_phons(dict):
	index = 0
	word_to_phons = {}
	with open(dict, 'r') as f:
		for line in f:
			index += 1
			splits = line.rstrip().split('\t')
			if len(splits) == 2 or len(splits[0]) == 0 or len(splits[1]) == 0:
				word = re.sub(r'\([0-9]\)$', '', splits[0])
				phon = splits[1]
				if word in word_to_phons:
					word_to_phons[word].append(phon)
				else:
					word_to_phons[word] = [ phon ]
			else:
				print >> sys.stderr, 'Error: line %d: %s' % (index, line)
	return word_to_phons


parser = argparse.ArgumentParser(description='Lookup phonetic transcriptions from the Sphinx dictionary')

parser.add_argument('--dict', type=str, action='store', dest='dict',
	default='/usr/local/share/pocketsphinx/model/lm/en_US/cmu07a.dic',
	help='dictionary')

parser.add_argument('-v', '--version', action='version', version='%(prog)s v0.1')

args = parser.parse_args()

word_to_phons = get_word_to_phons(args.dict)
#print >> sys.stderr, 'Done reading dict'

for word in sys.stdin:
	word = word.strip()
	word_lower = word.lower()
	if word_lower in word_to_phons:
		index = 0
		for phon in word_to_phons[word_lower]:
			if index == 0:
				print '%s\t%s' % (word, phon)
			else:
				print '%s(%d)\t%s' % (word, index, phon)
			index += 1
	else:
			print >> sys.stderr, 'Error: unknown word: %s' % (word)
			print '%s\t%s' % (word, 'EH R ER')
