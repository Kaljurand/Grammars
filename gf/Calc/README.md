Calc
====

This calculator grammar is a simple union of two grammars:

  * arithmetical expression grammar (`ExpEstl`, `ExtApp`)
  * unit conversion grammar (`UnitconvEst`, `UnitconvApp`)

Note that these grammars have no intersection, each input can either
be parsed by one or the other grammar but not both.

Note: ExpEst would cause left-recursion which we want to avoid,
so we use ExpEstl.


Compiling
---------

    gf -s --make --optimize-pgf --mk-index --path "../Exp/:../Unitconv/:../Numerals/:../Fraction/:../lib/" Calc???.gf


TODO
----

  * Maybe there exists a nicer way to achieve this union?
