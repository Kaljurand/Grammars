incomplete concrete AlarmIEng of Alarm = DateEng ** open AlarmLexEng, StringOper in {

flags coding = utf8;

lincat Alarm, HPeriod, MPeriod, Period = SS;

lin
	alarm_time x = prefixSS request_time x;
	alarm_period = request_period;

	hperiod n = n;
	mperiod n = n;

	period_h_min h m = ss (h.s ++ "hours and" ++ m.s ++ "minutes");
	period_h = postfixSS "hours";
	period_min = postfixSS "minutes";
}
