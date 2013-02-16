concrete UnitconvEng of Unitconv = FractionEng, UnitEng ** open StringOper, English in {

flags coding=utf8;

param
	PhraseType = REQUEST | EXPRESSION ;

oper
	-- TODO: this got approximated in JSGF
	-- c : SS -> SS -> { p1:Str; p2:Str } = \x,y -> {p1 = x.s ; p2 = y.s};
	c : SS -> SS -> PhraseType => Str = \x,y -> table {
		REQUEST => x.s ++ "to" ++ y.s ;
		EXPRESSION => x.s ++ "in" ++ y.s
	} ;

lincat Main = SS; Conv = PhraseType => Str ;

lin
	main num conv =
		requestSS (ss ("convert" ++ num.s ++ conv ! REQUEST)) |
		ss ((optStr "how much is") ++ num.s ++ conv ! EXPRESSION) ;
	length, mass, time, temperature, area, volume, angle, frequency,
	conv_speed, conv_acceleration,
	conv_energy, conv_power, currency = c ;

}
