abstract Expr = Fraction ** {

flags startcat = Expr ;

cat
	Expr ;

fun
	e_plus, e_minus, e_mult, e_div, e_pow : Expr -> Expr -> Expr;
	numeral : Fraction -> Expr;
}
