concrete CalcEng of Calc = ArithExprEng, UnitconvEng ** open StringOper, English in {

lincat Calc = SS;
lin
	unitconv = id SS;
	expr = prefixSS (optStr "how much is");
}
