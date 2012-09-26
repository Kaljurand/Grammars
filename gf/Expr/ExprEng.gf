concrete ExprEng of Expr = FractionEng ** open StringOper in {

flags coding=utf8;

lincat Expr = TermPrec;

lin
	e_plus = infixl 0 "plus";
	e_minus = infixl 0 "minus";
	e_mult = infixl 0 "times";
	e_div = infixl 0 "divided by";
	e_pow = infixl 0 "to the power of";
	numeral x = constant x.s ;
}
