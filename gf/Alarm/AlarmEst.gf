concrete AlarmEst of Alarm = DateEst ** open StringOper in {

flags coding = utf8;

lincat Alarm, HPeriod, MPeriod, Period = SS;

oper
	request : Str = ("ärata mind" ++ optStr "palun") | "palun ärata mind";

lin
	alarm_time = prefixSS (request ++ optStr "kell");
	alarm_period p = ss (request ++ p.s ++ "hiljem");

	hperiod n = ss (n.s ! indep);
	mperiod n = ss (n.s ! indep);

	period_h_min h m = ss (h.s ++ "tundi ja" ++ m.s ++ "minutit");
	period_min = postfixSS "minutit";
}
