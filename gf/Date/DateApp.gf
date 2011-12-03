concrete DateApp of Date = NumeralApp ** open StringOper in {

flags coding = utf8 ;

lincat
  Year, Day, Minute = Str ;
  Month, Weekday = Str ;
  Hour = Str ;
  Date, Time, SmallNumeral = SS ;

lin
  SmallNum n = {s = n.s ! noz} ;

  DFull y m d t = ss (y ++ "-" ++ m ++ "-" ++ d ++ t.s);

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

  MkTime h m = ss (h ++ ":" ++ m) ;

  H01 = "01";
  H02 = "02";
  H03 = "03";
  H04 = "04";
  H05 = "05";
  H06 = "06";
  H07 = "07";
  H08 = "08";
  H09 = "09";
  H10 = "10";
  H11 = "11";
  H12 = "12";
  H13 = "13";
  H14 = "14";
  H15 = "15" ;
  H16 = "16" ;
  H17 = "17" ;
  H18 = "18" ;
  H19 = "19" ;
  H20 = "20" ;
  H21 = "21" ;
  H22 = "22" ;
  H23 = "23" ;
  H24 = "00" ;

  MkMinute i = i.s ;

  WSun = "Sunday" ;
  WMon = "Monday" ;
  WTue = "Tuesday" ;
  WWed = "Wednesday" ;
  WThu = "Thursday" ;
  WFri = "Friday" ;
  WSat = "Saturday" ;

oper
  dot = "." ;

lin
  DToday = prefixSS "TODAY";
  DTomorrow = prefixSS "TOMORROW";
  DYesterday = prefixSS "YESTERDAY";

}
