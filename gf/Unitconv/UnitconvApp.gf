concrete UnitconvApp of Unitconv = FractionApp, UnitApp ** open StringOper in {

oper
	c : { s : Str } -> { s : Str } -> { s : Str }
		= \x,y -> { s = x.s ++ "to" ++ y.s };


lincat Main, Conv, FractionD = {s : Str} ;

lin
	main num conv = {s = "convert" ++ num.s ++ conv.s} ;

	length, mass, time, temperature, area, volume, angle, frequency,
	conv_speed, conv_acceleration,
	conv_energy, conv_power,
	currency = c ;

	general x1 u1 x2 u2 y1 v1 y2 v2 =
		infix "*"
		(infix "/" (parenthSS (c u1 v1)) (parenthSS (c u2 v2)))
		(infix "/" (infix "*" x1 y2) (infix "*" x2 y1)) ;

	fraction_copy = id SS;
	fraction_default = ss "1";
}
