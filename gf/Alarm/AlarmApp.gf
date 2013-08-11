concrete AlarmApp of Alarm = DateApp ** open StringOper in {

flags coding = utf8;

lincat Alarm, HPeriod, MPeriod, Period = SS;

lin
	alarm_time = prefixSS "alarm";
	alarm_period = prefixSS "alarm in";

	hperiod n = ss (n.s ! noz);
	mperiod n = ss (n.s ! noz);

	period_h_min h m = ss (h.s ++ "hours and" ++ m.s ++ "minutes");
	period_h = postfixSS "hours and 0 minutes";
	period_min = postfixSS "minutes";

}
