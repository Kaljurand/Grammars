#! /usr/bin/env python

# Usage:
#
# find . -name "*.gf" | xargs cat | ./make-diagram.py --concrete=True | dot -Tsvg | display
#
# or
#
# find . -name "*.gf" | xargs cat | ./make-diagram.py > out.dot
# dot -Tsvg out.dot > out.svg
# eog out.svg

"""GF grammar module hierarchy visualizer
"""

__author__ = 'kaljurand@gmail.com (Kaarel Kaljurand)'

import sys
import argparse
import os
import re
import time
import codecs
from os.path import join

header_dot = """/*
GF grammar structure
*/

digraph G {

node [shape = "rect"];
edge [arrowsize=1, color = "red", style = "bold"];
"""

footer_dot = "}"

re_abstract = re.compile('abstract (.*) =(.*){.*')
re_concrete = re.compile('concrete (.*) of (.*) =(.*){.*')

def match_abstract(m):
	dot_lines = []
	name = m.group(1).strip()
	supers = m.group(2)
	supers = re.sub('\*\*.*', '', supers)
	supers = re.sub('\[.*\]', '', supers)
	if re.match('^\s*$', supers):
		#dot_lines.append('"{:}"'.format(name))
		#dot_lines.append('"{:}" -> "_abstract_"'.format(name))
		return dot_lines
	for s in supers.split(','):
		s = s.strip()
		dot = '"{:}" -> "{:}"'.format(name, s)
		dot_lines.append(dot)
	return dot_lines


def match_concrete(m):
	dot_lines = []
	name = m.group(1).strip()
	# concrete -> abstract (this makes the diagram very complicated to read)
	#dot = '"{:}" -> "{:}" [style = "dashed" color = "navy"]'.format(name, m.group(2).strip())
	#dot_lines.append(dot)
	supers = m.group(3)
	supers = re.sub('open .*', '', supers)
	# Remove restricted inheritance
	supers = re.sub('-?\[[^\]]*\]', '', supers)
	supers = re.sub('\*\*.*', '', supers)
	if re.match('^\s*$', supers):
		#dot_lines.append('"{:}" -> "_concrete_" [color = "darkolivegreen"]'.format(name))
		return dot_lines
	for s in supers.split(','):
		s = s.strip()
		s = re.sub('\s*-.*', '', s)
		dot = '"{:}" -> "{:}" [color = "darkolivegreen"]'.format(name, s)
		dot_lines.append(dot)
	return dot_lines


def line_to_dot_lines(args, line):
	"""
	abstract Unitconv = Fraction, Unit ** {
	concrete UnitconvEst of Unitconv = FractionEst, UnitEst ** open Estonian in {
	"""
	dot_lines = []
	if args.abstract:
		m = re_abstract.search(line)
		if m:
			print '/* {:} */'.format(line)
			return match_abstract(m)
	if args.concrete:
		m = re_concrete.search(line)
		if m:
			print '/* {:} */'.format(line)
			return match_concrete(m)
	return []


parser = argparse.ArgumentParser(description='GF grammar module hierarchy visualizer')

parser.add_argument('-a', '--abstract', type=bool, action='store',
					default=True,
					dest='abstract',
					help='output abstract hierarchy')

parser.add_argument('-c', '--concrete', type=bool, action='store',
					default=False,
					dest='concrete',
					help='output concrete hierarchy')

parser.add_argument('-v', '--version', action='version', version='%(prog)s v0.1')

args = parser.parse_args()



print header_dot
for raw_line in sys.stdin.readlines():
	line = raw_line.strip()
	dot_lines = line_to_dot_lines(args, line)
	for l in dot_lines:
		print l
print footer_dot
