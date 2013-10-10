abstract Fraction = Number ** {

-- Fraction is an extension of Number which adds a function
-- for combining two numerals (e.g. with a decimal point).
-- It also adds a few numerals (null, half, pi, ...).
--
-- @author Kaarel Kaljurand
-- @version 2011-10-06

flags startcat = Fraction ;

cat Fraction; FractionBase; NumeralPair;

fun
	null : Number ;
	meaning_of_life : Number ;
	pair : Number -> Number -> NumeralPair;

	copy1 : Number -> FractionBase;
	copy2 : NumeralPair -> FractionBase;

	neg1 : Number -> FractionBase;
	neg2 : NumeralPair -> FractionBase;

	-- One cannot apply 'minus' to the result of 'quarter', e.g.
	-- "miinus veerand" is not possible, but one can of course say
	-- "miinus null koma viis".
	quarter : FractionBase;
	half : FractionBase;
	three_quarters : FractionBase;
	one_and_half : FractionBase;
	pi : FractionBase;

	-- There should be only one top node of the syntax tree.
	fraction : FractionBase -> Fraction;

def
	meaning_of_life = num (pot4as5 (pot3as4 (pot2as3 (pot1as2 (pot1plus n4 (pot0 n2)))))) ;
}
