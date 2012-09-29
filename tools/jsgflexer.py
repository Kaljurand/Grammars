# -+- coding:utf-8 -*-
# license: GPLv3 or later
# author: Arne Köhn <arne@arne-koehn.de>
# modified by Kaarel Kaljurand
import re
from ply import lex

tokens = (
	'RULENAME',
	'COMMENT',
	'STR',
	'NUMBER',
	'COMMA',
	'SEMICOLON',
	'EQUALS',
	'PIPE',
	'LESS',
	'GREATER',
	'LBRACKET',
	'RBRACKET',
	'LSBRACKET',
	'RSBRACKET',
	'MODIFIER'
	)

t_SEMICOLON = r';'
t_EQUALS = r'='
t_PIPE = r'\|'
t_LESS = r'<'
t_GREATER = r'>'
t_LBRACKET = r'\('
t_RBRACKET = r'\)'
t_LSBRACKET = r'\['
t_RSBRACKET = r'\]'

# no return value -> discard
def t_COMMENT(t):
	r'//[^\n]*|/\*[^/]*\*/|\#[^\n]*'
	pass

# A regular expression rule with some action code
def t_NUMBER(t):
	r'-?\d+'
	t.value = int(t.value)
	return t

# TODO: Support any character that is legal in an identifier in Java
def t_RULENAME(t):
	r'<[]\w+:;,=|/\()[@#%!^&~-]+>'
	return t

# TODO: not sure why \w does not match ÕÄÖÜõäöü etc.
def t_STR(t):
	r'[ÕÄÖÜõäöüŠšŽž\w~-]+'
	return t

# Define a rule so we can track line numbers
def t_newline(t):
	r'\n+'
	t.lexer.lineno += len(t.value)

# A string containing ignored characters (spaces and tabs)
t_ignore = ' \t'

# Error handling rule
def t_error(t):
	print "Illegal character '%s'" % t.value[0]
	t.lexer.skip(1)

# Build the lexer
lexer = lex.lex(reflags=re.UNICODE)
