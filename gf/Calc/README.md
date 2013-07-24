Calc
====

This calculator grammar is a simple union of two grammars:

  * arithmetical expression grammar (`ArithExpr`)
  * unit conversion grammar (`Unitconv`)

Note that these grammars have no intersection, each input can either
be parsed by one or the other grammar but not both.
