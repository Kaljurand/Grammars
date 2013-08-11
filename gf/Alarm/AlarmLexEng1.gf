instance AlarmLexEng1 of AlarmLexEng = open StringOper in {
flags coding = utf8;
oper
    -- Not sure which preposition is used in alarm/time expressions,
    -- so we support several of them.
    prep : Str = "to" | "at" | "for" | "in" ;

    request_time =
        optStr "please" ++ ("set" ++ optStr "the" ++ "alarm" ++ prep |
        "wake me up at") ;
    request_period time =
        ss ((optStr "please" ++ ("set" ++ optStr "the" ++ ("alarm" | "timer") ++ prep |
        "wake me up in")) ++ time.s) ;

}
