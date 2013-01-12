concrete ActionEng of Action = AlarmEng, CalcEng, DialEng ** open StringOper in {

lincat Action = SS;
lin
	-- not supported in English: Direction
	f1 _ = nonExistType SS;
	f2, f3, f4 = id SS;
	-- not supported in English: Weather
	f5 _ = nonExistType SS;
}
