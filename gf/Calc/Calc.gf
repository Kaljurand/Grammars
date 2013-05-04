abstract Calc = Expr, Unitconv ** {

-- Calc is a union of Expr and Unitconv.
--
-- @author Kaarel Kaljurand
-- @version 2011-10-03

flags startcat = Calc;

cat Calc;

fun
	expr : Expr -> Calc;
	unitconv : Unitconv -> Calc;
}
