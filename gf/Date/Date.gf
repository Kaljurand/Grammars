abstract Date = Numeral ** {

flags startcat = Date ;

cat
  Date ; Year ; Month ; Day ; Time ; Hour ; Minute ; Weekday ; Ampm ;
  SmallNumeral ;

fun
  SmallNum : Sub1000 -> SmallNumeral ;

  DFull : Year -> Month -> Day -> Time -> Date ;

  MkYear : SmallNumeral -> Year ;

  MJan, MFeb, MMar, MApr, MMay, MJun, MJul, MAug, MSep, MOct, MNov, MDec : Month ;

  MkDay : SmallNumeral -> Day ;

  MkTime : Ampm -> Hour -> Minute -> Time ;

  H01, H02, H03, H04, H05, H06, H07, H08, H09, H10, H11, H12 : Hour ;

  MkMinute : SmallNumeral -> Minute ;

  WSun, WMon, WTue, WWed, WThu, WFri, WSat : Weekday ;

  AM, PM : Ampm ;

-- noncanonical ways

  DToday, DYesterday, DTomorrow : Time -> Date ;

}

