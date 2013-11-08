concrete FractionApp of Fraction = NumberApp ** open StringOper in {

-- The simple combination by placing a dot between two numerals has the
-- following consequences for the lexical space:
--
--   * allowed: "1 . 200"
--   * not allowed: "1 . 002"
--
-- @author Kaarel Kaljurand
-- @version 2011-12-11


flags coding = utf8;

lincat Fraction, FractionBase, NumeralPair = SS;

lin
	null = ss "0";
	quarter = ss "0.25";
	half = ss "0.5";
	three_quarters = ss "0.75";
	one_and_half = ss "1.5";
	pi = ss "PI";
	pair = infixSS_glue ".";
	neg1 x = parenthSS_glue (prefixSS_glue "-" x);
	neg2 x = parenthSS_glue (prefixSS_glue "-" x);
	copy1, copy2, fraction = id SS;
}
