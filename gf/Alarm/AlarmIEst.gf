incomplete concrete AlarmIEst of Alarm = DateEst ** open AlarmLexEst, StringOper in {

flags coding = utf8;

lincat Alarm, HPeriod, MPeriod, Period = SS;

lin
	alarm_time = prefixSS (request ++ kell);
	alarm_period p = ss (request ++ p.s ++ "hiljem");

	hperiod n = ss (n.s ! indep);
	mperiod n = ss (n.s ! indep);

	period_h_min h m = ss (h.s ++ "tundi ja" ++ m.s ++ "minutit");
	period_h = postfixSS "tundi";
	period_min = postfixSS "minutit";

}
