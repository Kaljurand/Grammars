concrete AlarmEng of Alarm = DateEng ** open StringOper in {

flags coding = utf8;

lincat Alarm, HPeriod, MPeriod, Period = SS;

oper
	request_time : Str = "set" ++ optStr "the" ++ "alarm at";
	request_period : Str = "set" ++ optStr "the" ++ "timer for";

lin
	alarm_time = prefixSS request_time;
	alarm_period p = ss (request_period ++ p.s);

	hperiod n = n;
	mperiod n = n;

	period_h_min h m = ss (h.s ++ "hours and" ++ m.s ++ "minutes");
	period_min = postfixSS "minutes";
}
