concrete UnitconvEst of Unitconv = FractionEst, UnitEst ** open StringOper, Estonian in {

flags coding=utf8;

oper
	c : { s : Case => Str } -> { s : Case => Str } -> { s : Str }
		= \x,y -> { s = x.s ! SgPart ++ y.s ! PlIn };

lincat Main, Conv, FractionD = {s : Str};

lin
	main num conv = { s = num.s ++ conv.s } ;
	length, mass, time, temperature, area, volume, angle, frequency,
	conv_speed, conv_acceleration,
	conv_energy, conv_power, currency = c ;

	-- kaks eurot veerand tunnis teeb kolmveerand tunnis pool kroonides
	general x1 u1 x2 u2 y1 v1 y2 v2 = { s =
		x1.s ++ u1.s ! SgPart ++
		x2.s ++ u2.s ! SgIn ++
		"teeb" ++
		y2.s ++ v2.s ! SgIn ++
		y1.s ++ v1.s ! PlIn
	};

    fraction_copy = id SS;
    fraction_default = ss "";
}
