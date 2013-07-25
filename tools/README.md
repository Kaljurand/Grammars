Tools
=====

Various tools

Examples
--------

### Register the grammar with the server

Different grammars support different sets of languages, which must
be specified when the grammar is registered, e.g.

  - Est,Eng: Action Alarm Calc ArithExpr Go Unitconv
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

	Action (Est): 17 sec
	Action (Eng): 11 sec
	Alarm (Est,Eng): 3 sec
	Calc (Eng): 5 sec
	Expr (Est,Eng): 8 sec
	Unitconv (Est,Eng): 5 sec
	Direction (Est): 10 sec
	Tallinndirection (Est): 4 sec
