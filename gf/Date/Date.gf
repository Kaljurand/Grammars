abstract Date = Numeral ** {

flags startcat = Date ;

cat
  Date ; Year ; Month ; Day ; Time ; Hour ; Minute ; Weekday ;
  SmallNumeral ;

fun
  SmallNum : Sub1000 -> SmallNumeral ;

  DFull : Year -> Month -> Day -> Time -> Date ;

  MkYear : SmallNumeral -> Year ;

  MJan, MFeb, MMar, MApr, MMay, MJun, MJul, MAug, MSep, MOct, MNov, MDec : Month ;

  MkDay : SmallNumeral -> Day ;

  MkTime : Hour -> Minute -> Time ;

  H01, H02, H03, H04, H05, H06, H07, H08, H09, H10, H11, H12,
  H13, H14, H15, H16, H17, H18, H19, H20, H21, H22, H23, H24 : Hour ;

  MkMinute : SmallNumeral -> Minute ;

  WSun, WMon, WTue, WWed, WThu, WFri, WSat : Weekday ;

-- noncanonical ways

  DToday, DYesterday, DTomorrow : Time -> Date ;

}

