concrete ArithExprApp of ArithExpr = FractionApp ** open StringOper in {

flags coding=utf8;

lincat ArithExpr = SS;

lin
	e_plus = infixSS "+";
	e_minus = infixSS "-";
	e_mult = infixSS "*";
	e_div = infixSS "/";
	e_pow = infixSS "^";

	numeral x = x;
}
