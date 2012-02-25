concrete AlarmEst of Alarm = DateEst ** open StringOper in {

flags coding = utf8;

lincat Alarm, HPeriod, MPeriod, Period = SS;

lin
	alarm_time = prefixSS ("ärata mind" ++ optStr "kell");
	alarm_period p = ss ("ärata mind" ++ p.s ++ "hiljem");

	hperiod n = ss (n.s ! indep);
	mperiod n = ss (n.s ! indep);

	period_h_min h m = ss (h.s ++ "tundi ja" ++ m.s ++ "minutit");
	period_min = postfixSS "minutit";
}
