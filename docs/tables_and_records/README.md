How are tables and records preserved in output formats?
=======================================================

  - C1 uses records: `Str * Str`
  - C2 uses strings: `Str`
  - C3 uses tables: `S = Field => Str`

All define the same language but only C2 is preserved in BNF.

Tests
-----

Generate with a grammar to check that all concrete syntaxes define
the same language.

	echo "gt -cat=P | l -treebank -all" | gf -quiet -run TestC*.gf > Test.gt.txt

Translate into other formats (ebnf, regexp) to see if the
syntax is preserved.

	gf --make --output-format=ebnf TestC*.gf

	gf --make --output-format=regexp TestC*.gf
