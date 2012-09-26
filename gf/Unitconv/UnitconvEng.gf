concrete UnitconvEng of Unitconv = FractionEng, UnitEng ** open StringOper in {

flags coding=utf8;

oper
	c : SS -> SS -> SS
		= \x,y -> { s = x.s ++ "to" ++ y.s };

lincat Main, Conv, FractionD = SS;

lin
	main num conv = { s = "convert" ++ num.s ++ conv.s } ;
	length, mass, time, temperature, area, volume, angle, frequency,
	conv_speed, conv_acceleration,
	conv_energy, conv_power, currency = c ;

	-- kaks eurot veerand tunnis makes kolmveerand tunnis pool kroonides
	general x1 u1 x2 u2 y1 v1 y2 v2 = { s =
		x1.s ++ u1.s ++ "in" ++
		x2.s ++ u2.s ++
		"makes" ++
		"in" ++ y2.s ++ v2.s ++
		"in" ++ y1.s ++ v1.s
	};

    fraction_copy = id SS;
    fraction_default = ss "";
}
