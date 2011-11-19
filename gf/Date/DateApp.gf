concrete DateApp of Date = NumeralApp ** open StringOper in {

flags coding = utf8 ;

lincat
  Date, Year, Day, Time, Minute = Str ;
  Month, Weekday = Str ;
  Hour = PAMPM => Str ;
  Ampm = {s : Str ; p : PAMPM} ;
  SmallNumeral = SS ;

lin
  SmallNum n = {s = n.s ! noz} ;

  DFull y m d t = y ++ "-" ++ m ++ "-" ++ d ++ t ;

  MkYear i = i.s ;

  MJan = "01" ;
  MFeb = "02" ;
  MMar = "03" ;
  MApr = "04" ;
  MMay = "05" ;
  MJun = "06" ;
  MJul = "07" ;
  MAug = "08" ;
  MSep = "09" ;
  MOct = "10" ;
  MNov = "11" ;
  MDec = "12" ;

  MkDay i = i.s ;

  MkTime ap h m = h ! ap.p ++ ":" ++ m ++ ap.s ;

  H01 = ampm "1" "13" ;
  H02 = ampm "2" "14" ;
  H03 = ampm "3" "15" ;
  H04 = ampm "4" "16" ;
  H05 = ampm "5" "17" ;
  H06 = ampm "6" "18" ;
  H07 = ampm "7" "19" ;
  H08 = ampm "8" "20" ;
  H09 = ampm "9" "21" ;
  H10 = ampm "10" "22" ;
  H11 = ampm "11" "23" ;
  H12 = ampm "0" "12" ; -- 12.01 a.m. = 0.01 ; 12.01 p.m. = 13.01

  MkMinute i = i.s ;

  WSun = "Sunday" ;
  WMon = "Monday" ;
  WTue = "Tuesday" ;
  WWed = "Wednesday" ;
  WThu = "Thursday" ;
  WFri = "Friday" ;
  WSat = "Saturday" ;

  AM = {s = [] ; p = PAM} ;
  PM = {s = [] ; p = PPM} ;

oper
  dot = "." ;

  ampm : Str -> Str -> PAMPM => Str = \a,p -> table {PAM => a ; PPM => p} ;

param
  PAMPM = PAM | PPM ;

lin
  DToday t     = "TODAY" ++ t ;
  DTomorrow t  = "TOMORROW" ++ t ;
  DYesterday t = "YESTERDAY" ++ t ;

}
