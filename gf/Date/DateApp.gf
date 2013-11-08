concrete DateApp of Date = NumberApp ** open StringOper in {

flags coding = utf8 ;

lincat
  Year, Day, Hour, Minute = Str ;
  Month, Weekday = Str ;
  Date, Timestamp, YearNumber = SS ;

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

  H00 = "00";
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
  H15 = "15";
  H16 = "16";
  H17 = "17";
  H18 = "18";
  H19 = "19";
  H20 = "20";
  H21 = "21";
  H22 = "22";
  H23 = "23";

  M00 = "00";
  M01 = "01";
  M02 = "02";
  M03 = "03";
  M04 = "04";
  M05 = "05";
  M06 = "06";
  M07 = "07";
  M08 = "08";
  M09 = "09";
  M10 = "10";
  M11 = "11";
  M12 = "12";
  M13 = "13";
  M14 = "14";
  M15 = "15";
  M16 = "16";
  M17 = "17";
  M18 = "18";
  M19 = "19";
  M20 = "20";
  M21 = "21";
  M22 = "22";
  M23 = "23";
  M24 = "24";
  M25 = "25";
  M26 = "26";
  M27 = "27";
  M28 = "28";
  M29 = "29";
  M30 = "30";
  M31 = "31";
  M32 = "32";
  M33 = "33";
  M34 = "34";
  M35 = "35";
  M36 = "36";
  M37 = "37";
  M38 = "38";
  M39 = "39";
  M40 = "40";
  M41 = "41";
  M42 = "42";
  M43 = "43";
  M44 = "44";
  M45 = "45";
  M46 = "46";
  M47 = "47";
  M48 = "48";
  M49 = "49";
  M50 = "50";
  M51 = "51";
  M52 = "52";
  M53 = "53";
  M54 = "54";
  M55 = "55";
  M56 = "56";
  M57 = "57";
  M58 = "58";
  M59 = "59";

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
