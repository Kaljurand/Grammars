abstract Calc = ArithExpr, Unitconv ** {

flags startcat = Calc;

cat Calc;

fun
	expr : ArithExpr -> Calc;
	unitconv : Unitconv -> Calc;
}
