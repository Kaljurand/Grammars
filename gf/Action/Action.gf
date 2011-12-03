abstract Action = Alarm, Calc, Direction ** {

flags startcat = Action;

cat Action;

fun
	f1 : Direction -> Action;
	f2 : Calc -> Action;
	f3 : Alarm -> Action;
}
