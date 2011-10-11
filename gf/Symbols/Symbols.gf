abstract Symbols = Digit, Letter ** {

-- Sequence of digits and letters
-- @author Kaarel Kaljurand
-- @version 2011-10-11

flags startcat = Symbols;

cat Symbols;

fun
	empty : Symbols;
	digit : Digit -> Symbols -> Symbols;
	letter : Letter -> Symbols -> Symbols;
}
