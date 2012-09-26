concrete FractionEng of Fraction = NumeralEng ** open StringOper in {

flags coding = utf8;

lincat Fraction, FractionBase, NumeralPair = SS;

lin
	null = ss "zero";
	quarter = ss "zero point twenty five";
	half = ss "zero point five";
	three_quarters = ss "zero point seventy five";
	one_and_half = ss "one point five";
	pi = ss "pie";
	pair = infixSS "point";
	neg1, neg2 = prefixSS "minus";
	copy1, copy2, fraction = id SS;
}
