concrete FractionEst of Fraction = NumberEst ** open StringOper in {

flags coding = utf8;

lincat Fraction, FractionBase, NumeralPair = SS;

lin
	null = ss "null";
	meaning_of_life = ss "elu mõte";
	quarter = ss "veerand";
	half = ss "pool";
	three_quarters = ss "kolm veerand";
	one_and_half = ss "pool teist";
	pi = ss "Pii";
	pair = infixSS "koma";
	neg1, neg2 = prefixSS "miinus";
	copy1, copy2, fraction = id SS;
}
