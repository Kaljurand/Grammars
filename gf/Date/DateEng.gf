concrete DateEng of Date = NumberEng ** open StringOper, ResDateEng in {

flags coding = utf8 ;

lincat
  Year, Day, Hour, Minute = Str ;
  Month, Weekday = Case => Str ;
  Date, Timestamp, YearNumber = SS ;

lin
  SmallNum n = n ;

  DFull y m d t = ss (opts (d ++ (m ! Nom)) ++ opts (opts "year" ++ y) ++ opts (klo ++ t.s) );

  MkYear i = i.s ;

  MJan = mkNoun "January" ;
  MFeb = mkNoun "February" ;
  MMar = mkNoun "March" ;
  MApr = mkNoun "April" ;
  MMay = mkNoun "May" ;
  MJun = mkNoun "June" ;
  MJul = mkNoun "July" ;
  MAug = mkNoun "August" ;
  MSep = mkNoun "September" ;
  MOct = mkNoun "October" ;
  MNov = mkNoun "November" ;
  MDec = mkNoun "December" ;

  MkDay i = i.s ;

  MkTime h m = ss (h ++ m) ;

  H00 = mkTen d2 d4;
  H01 = mkUnit d1;
  H02 = mkUnit d2;
  H03 = mkUnit d3;
  H04 = mkUnit d4;
  H05 = mkUnit d5;
  H06 = mkUnit d6;
  H07 = mkUnit d7;
  H08 = mkUnit d8;
  H09 = mkUnit d9;
  H10 = mkTen d1;
  H11 = mkTeen d1;
  H12 = mkTeen d2;
  H13 = mkTeen d3;
  H14 = mkTeen d4;
  H15 = mkTeen d5;
  H16 = mkTeen d6;
  H17 = mkTeen d7;
  H18 = mkTeen d8;
  H19 = mkTeen d9;
  H20 = mkTen d2;
  H21 = mkTen d2 d1;
  H22 = mkTen d2 d2;
  H23 = mkTen d2 d3;

  M00 = "oh clock";
  M01 = mkNull d1;
  M02 = mkNull d2;
  M03 = mkNull d3;
  M04 = mkNull d4;
  M05 = mkNull d5;
  M06 = mkNull d6;
  M07 = mkNull d7;
  M08 = mkNull d8;
  M09 = mkNull d9;
  M10 = mkTen d1;
  M11 = mkTeen d1;
  M12 = mkTeen d2;
  M13 = mkTeen d3;
  M14 = mkTeen d4;
  M15 = mkTeen d5;
  M16 = mkTeen d6;
  M17 = mkTeen d7;
  M18 = mkTeen d8;
  M19 = mkTeen d9;
  M20 = mkTen d2;
  M21 = mkTen d2 d1;
  M22 = mkTen d2 d2;
  M23 = mkTen d2 d3;
  M24 = mkTen d2 d4;
  M25 = mkTen d2 d5;
  M26 = mkTen d2 d6;
  M27 = mkTen d2 d7;
  M28 = mkTen d2 d8;
  M29 = mkTen d2 d9;
  M30 = mkTen d3;
  M31 = mkTen d3 d1;
  M32 = mkTen d3 d2;
  M33 = mkTen d3 d3;
  M34 = mkTen d3 d4;
  M35 = mkTen d3 d5;
  M36 = mkTen d3 d6;
  M37 = mkTen d3 d7;
  M38 = mkTen d3 d8;
  M39 = mkTen d3 d9;
  M40 = mkTen d4;
  M41 = mkTen d4 d1;
  M42 = mkTen d4 d2;
  M43 = mkTen d4 d3;
  M44 = mkTen d4 d4;
  M45 = mkTen d4 d5;
  M46 = mkTen d4 d6;
  M47 = mkTen d4 d7;
  M48 = mkTen d4 d8;
  M49 = mkTen d4 d9;
  M50 = mkTen d5;
  M51 = mkTen d5 d1;
  M52 = mkTen d5 d2;
  M53 = mkTen d5 d3;
  M54 = mkTen d5 d4;
  M55 = mkTen d5 d5;
  M56 = mkTen d5 d6;
  M57 = mkTen d5 d7;
  M58 = mkTen d5 d8;
  M59 = mkTen d5 d9;

  WSun = mkNoun "Sunday" ;
  WMon = mkNoun "Monday" ;
  WTue = mkNoun "Tuesday" ;
  WWed = mkNoun "Wednesday" ;
  WThu = mkNoun "Thursday" ;
  WFri = mkNoun "Friday" ;
  WSat = mkNoun "Saturday" ;

  DToday t     = ss ("today" ++ opts (klo ++ t.s)) ;
  DTomorrow t  = ss ("tomorrow" ++ opts (klo ++ t.s)) ;
  DYesterday t = ss ("yesterday" ++ opts (klo ++ t.s)) ;

}
