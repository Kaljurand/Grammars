concrete DateEst of Date = NumeralEst ** open StringOper, Estonian in {

flags coding = utf8 ;

lincat
  Year, Day, Hour, Minute = Str ;
  Month, Weekday = DateEst__Case => Str ;
  Date, Timestamp, YearNumber = SS ;

lin
  SmallNum n = ss (n.s ! indep) ;

  DFull y m d t = ss (opts (d ++ (m ! Nom)) ++ opts (opts "aastal" ++ y) ++ opts (klo ++ t.s) );

  MkYear i = i.s ;

  MJan = mkNoun "jaanuar" ;
  MFeb = mkNoun "veebruar" ;
  MMar = mkNoun "märts" ;
  MApr = mkNoun "aprill" ;
  MMay = mkNoun "mai" ;
  MJun = mkNoun "juuni" ;
  MJul = mkNoun "juuli" ;
  MAug = mkNoun "august" ;
  MSep = mkNoun "september" ;
  MOct = mkNoun "oktoober" ;
  MNov = mkNoun "november" ;
  MDec = mkNoun "detsember" ;

  MkDay i = i.s ;

  MkTime h m = ss (h ++ (opts m)) ;

  H00 = mkKym d2 d4;
  H01 = d1;
  H02 = d2;
  H03 = d3;
  H04 = d4;
  H05 = d5;
  H06 = d6;
  H07 = d7;
  H08 = d8;
  H09 = d9;
  H10 = "kümme";
  H11 = mkTeist d1;
  H12 = mkTeist d2;
  H13 = mkTeist d3;
  H14 = mkTeist d4;
  H15 = mkTeist d5;
  H16 = mkTeist d6;
  H17 = mkTeist d7;
  H18 = mkTeist d8;
  H19 = mkTeist d9;
  H20 = mkKym d2;
  H21 = mkKym d2 d1;
  H22 = mkKym d2 d2;
  H23 = mkKym d2 d3;

  M00 = mkNull d0;
  M01 = mkNull d1;
  M02 = mkNull d2;
  M03 = mkNull d3;
  M04 = mkNull d4;
  M05 = mkNull d5;
  M06 = mkNull d6;
  M07 = mkNull d7;
  M08 = mkNull d8;
  M09 = mkNull d9;
  M10 = "kümme";
  M11 = mkTeist d1;
  M12 = mkTeist d2;
  M13 = mkTeist d3;
  M14 = mkTeist d4;
  M15 = mkTeist d5;
  M16 = mkTeist d6;
  M17 = mkTeist d7;
  M18 = mkTeist d8;
  M19 = mkTeist d9;
  M20 = mkKym d2;
  M21 = mkKym d2 d1;
  M22 = mkKym d2 d2;
  M23 = mkKym d2 d3;
  M24 = mkKym d2 d4;
  M25 = mkKym d2 d5;
  M26 = mkKym d2 d6;
  M27 = mkKym d2 d7;
  M28 = mkKym d2 d8;
  M29 = mkKym d2 d9;
  M30 = mkKym d3;
  M31 = mkKym d3 d1;
  M32 = mkKym d3 d2;
  M33 = mkKym d3 d3;
  M34 = mkKym d3 d4;
  M35 = mkKym d3 d5;
  M36 = mkKym d3 d6;
  M37 = mkKym d3 d7;
  M38 = mkKym d3 d8;
  M39 = mkKym d3 d9;
  M40 = mkKym d4;
  M41 = mkKym d4 d1;
  M42 = mkKym d4 d2;
  M43 = mkKym d4 d3;
  M44 = mkKym d4 d4;
  M45 = mkKym d4 d5;
  M46 = mkKym d4 d6;
  M47 = mkKym d4 d7;
  M48 = mkKym d4 d8;
  M49 = mkKym d4 d9;
  M50 = mkKym d5;
  M51 = mkKym d5 d1;
  M52 = mkKym d5 d2;
  M53 = mkKym d5 d3;
  M54 = mkKym d5 d4;
  M55 = mkKym d5 d5;
  M56 = mkKym d5 d6;
  M57 = mkKym d5 d7;
  M58 = mkKym d5 d8;
  M59 = mkKym d5 d9;

  WSun = mkNoun "pühapäev" ;
  WMon = mkNoun "esmaspäev" ;
  WTue = mkNoun "teisipäev" ;
  WWed = mkNoun "kolmapäev" ;
  WThu = mkNoun "neljapäev" ;
  WFri = mkNoun "reede" ;
  WSat = mkNoun "laupäev" ;

oper
  opts = optStr ;
  klo = "kell" ;

  mkKym = overload {
    mkKym : Str -> Str -> Str = \x,y -> x ++ "kümmend" ++ y;
    mkKym : Str -> Str = \x -> x ++ "kümmend";
  };

  mkTeist : Str -> Str = \x -> x ++ "teist";
  mkNull : Str -> Str = \x -> d0 ++ x;

  mkNoun : Str -> DateEst__Case => Str = \w -> table {
    Nom => w ;
    Ad => w + "al"
  } ;

param
  DateEst__Case = Nom | Ad ;

lin
  DToday t     = ss ("täna" ++ opts (klo ++ t.s)) ;
  DTomorrow t  = ss ("homme" ++ opts (klo ++ t.s)) ;
  DYesterday t = ss ("eile" ++ opts (klo ++ t.s)) ;

}
