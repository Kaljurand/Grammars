gf --path "Calc:Address:Direction:Expr:Unitconv:Numerals:Fraction:Symbols:Digit:Letter:lib" --run < make_dg.gfs

dot -Tsvg _gfdepgraph.dot > dg.svg
cat dg.svg | display
