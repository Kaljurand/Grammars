Tools
=====

Various tools

Examples
--------

### Register the grammar with the server

Different grammars support different sets of languages, which must
be specified when the grammar is registered, e.g.

  - Est,Eng: Action Alarm Calc Expr Go Unitconv
  - Est: Direction Estvrp Symbols Tallinndirection

Commandline examples:

	python register-pgf.py --langs=Est,Eng Alarm Dial

	python register-pgf.py --langs=Est,Eng \
		--server=http://bark.phon.ioc.ee/test/speech-api/v1 \
		--grammars=http://kaljurand.github.com/Grammars/grammars/pgf/ \
		Alarm Dial


Examples of possible error conditions:

	Alarm: 0.94 sec: Sorry, failed to process request. Reason: Failed to convert JSGF for lang Eng
	Noexist: 0.72 sec: Sorry, failed to process request. Reason: 404 Not Found


Examples of registration speeds:

	Action: 47.09 sec: Request completed
	Alarm: 1.79 sec: Request completed
	Calc: 36.91 sec: Request completed
	Expr: 8.51 sec: Request completed
	Go: 1.41 sec: Request completed
	Unitconv: 3.06 sec: Request completed
	Direction: 10.77 sec: Request completed
	Estvrp: 1.32 sec: Request completed
	Symbols: 1.45 sec: Request completed
	Tallinndirection: 3.96 sec: Request completed
