#! /usr/bin/env python
# coding: utf8

# Creates two GF files, abstract and concrete, containing the strings
# found in STDIN. It is up to the user to make sure that STDIN contains
# the strings in the required order, without duplicates, and UTF8 encoded.
# Legal function names are automatically created and input lines for which
# a legal function name is not found are rejected.

# Usage:
#
# $ cat tallinn3.htm | sh filter.sh | python make_fun.py --lang Est Tallinnstreet
# Warning: Ignoring line 1: 1. liin
# Warning: Ignoring line 22: A. H. Tammsaare tee
# Warning: Ignoring line 654: Maneeži
# Warning: Ignoring line 760: Nikolai v. Glehni põik

# @author Kaarel Kaljurand
# @version 2011-10-23
#
# TODO:
#
# * don't use explicit \n
# * according to the doc also apostrophe is allowed as part of function names,
#   so it would be nice to mark the beginning of encoding with an apostrophe,
#   i.e. 'uuml, but didn't get it to work in all cases (i.e. got GF parse error)

import sys
import re
import argparse

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


def get_header_abstract(name):
	return "abstract " + name + " = {\nflags startcat = " + name + ";\ncat " + name + ";\nfun\n"


def get_footer_abstract(name):
	return ": " + name + ";}"


def get_header_concrete(name, lang):
	return "concrete " + name + lang + " of " + name + " = {\nflags coding=utf8;\nlincat " + name + " = Str;\nlin\n"


def get_footer_concrete():
	return "}"


def get_args():
	p = argparse.ArgumentParser(description='Converts a newline-separated list of strings (from STDIN) into a GF grammar resulting in 2 gf-files written into the current directory')
	p.add_argument('name', type=str, help='set the name of the grammar')
	p.add_argument('-l', '--lang', type=str, action='store', dest='lang', default='Est', help='set the language (default: Est)')
	p.add_argument('-v', '--version', action='version', version='%(prog)s v0.1')
	return p.parse_args()

args = get_args()

name_abstract = args.name + ".gf"
name_concrete = args.name + args.lang + ".gf"

f = open(name_concrete, 'w')
f.write(get_header_concrete(args.name, args.lang))
i = 0
fun_names = []
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
		fun_names.append(line_key)
f.write(get_footer_concrete())
f.close()

f = open(name_abstract, 'w')
f.write(get_header_abstract(args.name))
l = len(fun_names)
i = 0
for name in fun_names:
	i = i + 1
	if i < l:
		f.write('{:},\n'.format(name))
	else:
		f.write('{:}\n'.format(name))
f.write(get_footer_abstract(args.name))
f.close()
