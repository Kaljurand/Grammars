instance AlarmLexEst1 of AlarmLexEst = open StringOper in {
flags coding = utf8;
oper
	request : Str = ("ärata mind" ++ optStr "palun") | "palun ärata mind" ;
	kell : Str = optStr "kell" ;
}
