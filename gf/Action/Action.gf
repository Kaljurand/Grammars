abstract Action = Alarm, Calc, Dial, Direction, Weather ** {

flags startcat = Action;

cat Action;

fun
	f1 : Direction -> Action;
	f2 : Calc -> Action;
	f3 : Alarm -> Action;
	f4 : Dial -> Action;
	f5 : Weather -> Action;
}
