Action
======

This grammar is meant to be the union of all other grammars that make
sense in the context of "voice actions", e.g.

  * calculations
  * map queries
  * event/alarm scheduling

Compiling
---------

    gf -s --make --optimize-pgf --mk-index --path "Alarm:Calc:Date:Eeppl:Address:Direction:Expr:Unitconv:Numeral:Fraction:Tallinnaddress:lib" Action/Action???.gf
