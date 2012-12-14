concrete FractionEng of Fraction = NumeralEng ** open StringOper in {

flags coding = utf8;

lincat Fraction, FractionBase, NumeralPair = SS;

lin
	null = ss "zero";
	quarter = ss "quarter";
	half = ss "half";
	three_quarters = ss "three quarters";
	one_and_half = ss "one and half";
	pi = ss "pie";
	pair = infixSS "point";
	neg1, neg2 = prefixSS "minus";
	copy1, copy2, fraction = id SS;
}
