import sys
from jsgflexer import tokens, lexer

for line in sys.stdin:
	lexer.input(line)
	while True:
		tok = lexer.token()
		if not tok: break
		print tok.type + "\t" + tok.value
