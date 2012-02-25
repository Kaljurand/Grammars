abstract Alarm = Date ** {

flags startcat = Alarm;

cat Alarm;
cat Period;
cat HPeriod;
cat MPeriod;

fun
	alarm_time : Timestamp -> Alarm;
	alarm_period : Period -> Alarm;

	hperiod : Sub100 -> HPeriod;
	mperiod : Sub1000 -> MPeriod;

	period_h_min : HPeriod -> MPeriod -> Period;
	period_min : MPeriod -> Period;
}
