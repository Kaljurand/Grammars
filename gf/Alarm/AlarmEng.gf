concrete AlarmEng of Alarm = DateEng ** open StringOper, English in {

flags coding = utf8;

lincat Alarm, HPeriod, MPeriod, Period = SS;

oper
	-- Note sure which preposition is used in alarm/time expressions,
	-- so we support several of them.
	prep : Str = "to" | "at" | "for" | "in";
	request_time : Str =
		"set" ++ optStr "the" ++ "alarm" ++ prep |
		"wake me up at" ;
	request_period : Str =
		"set" ++ optStr "the" ++ ("alarm" | "timer") ++ prep |
		"wake me up in" ;

lin
	alarm_time x = requestSS (prefixSS request_time x);
	alarm_period p = requestSS (ss (request_period ++ p.s));

	hperiod n = n;
	mperiod n = n;

	period_h_min h m = ss (h.s ++ "hours and" ++ m.s ++ "minutes");
	period_min = postfixSS "minutes";
}
