concrete UnitconvextApp of Unitconvext = UnitconvApp ** open StringOper in {

oper
	c1 : SS -> SS -> SS
		= \x,y -> { s = "convert" ++ x.s ++ "to" ++ y.s };


lincat FractionD = SS ;

lin
	general x1 u1 x2 u2 y1 v1 y2 v2 =
		infix "*"
		(infix "/" (parenthSS (c1 u1 v1)) (parenthSS (c1 u2 v2)))
		(infix "/" (infix "*" x1 y2) (infix "*" x2 y1)) ;

	fraction_copy = id SS;
	fraction_default = ss "1";
}
