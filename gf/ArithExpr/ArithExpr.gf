abstract ArithExpr = Fraction ** {

flags startcat = ArithExpr ;

cat
	ArithExpr ;

fun
	e_plus, e_minus, e_mult, e_div, e_pow : Fraction -> ArithExpr -> ArithExpr;
	numeral : Fraction -> ArithExpr;
}
