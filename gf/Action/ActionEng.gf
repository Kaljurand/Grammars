concrete ActionEng of Action = AlarmEng, CalcEng, DialEng ** open StringOper in {

lincat Action = SS;
lin
	-- not supported in English: f1:Direction->Action
	f1 _ = nonExistType SS;
	f2, f3, f4 = id SS;
}
