concrete UnitconvextEng of Unitconvext = UnitconvEng ** open StringOper in {

flags coding=utf8;

lincat FractionD = SS;

lin
    -- two euros in 1/4 hour makes in 3/4 hours in crowns
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
