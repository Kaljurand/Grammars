instance AlarmLexEng2 of AlarmLexEng = open StringOper in {
flags coding = utf8;
oper
	request_time = "setting the alarm to" ;
	request_period time = ss ("setting the alarm for" ++ time.s ++ "from now") ;

}
