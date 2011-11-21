Calc
====

This calculator grammar is a simple union of two grammars:

  * arithmetical expression grammar (`ExprEst`, `ExtrApp`)
  * unit conversion grammar (`UnitconvEst`, `UnitconvApp`)

Note that these grammars have no intersection, each input can either
be parsed by one or the other grammar but not both.

Note: ExprEstamb would cause left-recursion which we want to avoid,
so we use ExprEst.


Compiling
---------

    gf -s --make --optimize-pgf --mk-index --path "Expr:Unitconv:Numeral:Fraction:lib" Calc/Calc???.gf
