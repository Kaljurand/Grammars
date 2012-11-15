concrete ActionEng of Action = AlarmEng, CalcEng ** open StringOper in {

lincat Action = SS;
lin
	-- not supported in English: f1:Direction->Action
	f1 _ = nonExistType SS;
	f4 _ = nonExistType SS;
	f2, f3 = id SS;
}
