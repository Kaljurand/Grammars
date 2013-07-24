concrete ArithExprEng of ArithExpr = FractionEng ** open StringOper in {

flags coding=utf8;

lincat ArithExpr = SS;

lin
	e_plus = infixSS "plus";
	e_minus = infixSS "minus";
	e_mult = infixSS "times";
	e_div = infixSS "divided by";
	e_pow = infixSS "to the power of";

	numeral x = x;
}
