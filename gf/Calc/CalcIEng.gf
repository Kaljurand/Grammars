incomplete concrete CalcIEng of Calc = ArithExprEng, UnitconvEng ** open CalcLexEng, StringOper in {

lincat Calc = SS;
lin
	unitconv = id SS;
	expr = prefixSS request;
}
