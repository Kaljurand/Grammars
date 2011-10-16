#! /usr/bin/env python
# coding: utf8

# Creates two GF files, abstract and concrete, containing the words
# found in STDIN.

# Usage:
#
# cat tallinn3.htm | sh filter.sh | python make_street.py
#
# TODO:
#
# * don't use explicit \n
# * according to the doc also apostrophe is allowed as part of function names,
#   so it would be nice to mark the beginning of encoding with an apostrophe,
#   i.e. 'uuml, but didn't get it to work in all cases (i.e. got GF parse error)

import sys
import re

name_abstract = "Eeppl.gf"
name_concrete = "EepplEst.gf"

translations = (
	(' ', '_'),
	('-', '_'),
	('õ', 'otilde'),
	('ä', 'auml'),
	('ö', 'ouml'),
	('ü', 'uuml'),
	('Õ', 'Otilde'),
	('Ä', 'Auml'),
	('Ö', 'Ouml'),
	('Ü', 'Uuml'),
)

header_abstract = """abstract Eeppl = {

flags startcat = Eeppl;

cat Eeppl;
fun
"""

header_concrete = """concrete EepplEst of Eeppl = {

flags coding=utf8;
lincat Eeppl = Str;

lin
"""

footer_abstract = ": Eeppl;}"
footer_concrete = "}"

f = open(name_concrete, 'w')
f.write(header_concrete)
i = 0
names = {}
for line in sys.stdin.readlines():
	i = i + 1
	line = line.rstrip()
	line_key = line
	line_val = line
	for from_str, to_str in translations:
		line_key = line_key.replace(from_str, to_str)
	if not re.match('^[a-zA-Z0-9\'_]+$', line_key):
		print >> sys.stderr, 'Warning: Ignoring line {:}: {:}'.format(i, line)
	else:
		f.write('{:} = "{:}";\n'.format(line_key, line_val))
		names[line_key] = 1
f.write(footer_concrete)
f.close()

f = open(name_abstract, 'w')
f.write(header_abstract)
l = len(names)
i = 0
for name in names:
	i = i + 1
	if i < l:
		f.write('{:},\n'.format(name))
	else:
		f.write('{:}\n'.format(name))
f.write(footer_abstract)
f.close()
