Numeral
=======

Based on

  * examples/numerals/Numerals.gf
  * examples/numerals/decimal.gf
  * examples/numerals/finnish.gf
  * examples/numerals/english.gf

found in the GF 3.2.9 source distribution.

`NumeralEst` is based on `finnish`.

`NumeralApp` is based on `decimal` but uses `glue` instead of `++`.


Compiling
---------

    gf -s --make --optimize-pgf --mk-index --path lib Numeral/Numeral???.gf
