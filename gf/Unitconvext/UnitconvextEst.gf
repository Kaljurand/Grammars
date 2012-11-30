concrete UnitconvextEst of Unitconvext = UnitconvEst ** open StringOper, Estonian in {

flags coding=utf8;

lincat FractionD = SS;

lin
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
