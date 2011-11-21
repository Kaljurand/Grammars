concrete ExprEstamb of Expr = FractionEst ** open StringOper in {

flags coding=utf8;

lincat Expr = SS;

lin
	e_plus = infixSS "pluss";
	e_minus = infixSS "miinus";
	e_mult = infixSS "korda";
	e_div = infixSS "jagatud";
	e_pow = infixSS "astmel";

	numeral x = x;
}
