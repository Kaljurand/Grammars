concrete DateEst of Date = NumeralEst ** open StringOper in {

flags coding = utf8 ;

lincat
  Date, Year, Day, Time, Minute = Str ;
  Month, Weekday = Case => Str ;
  Hour = Str ;
  SmallNumeral = SS ;

lin
  SmallNum n = ss (n.s ! indep) ;

  DFull y m d t = opts (d ++ (m ! Nom)) ++ opts (opts "aastal" ++ y) ++ opts (klo ++ t) ;

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

  MkTime h m = h ++ (opts m) ;

  H01 = "üks";
  H02 = "kaks";
  H03 = "kolm";
  H04 = "neli";
  H05 = "viis";
  H06 = "kuus";
  H07 = "seitse";
  H08 = "kaheksa";
  H09 = "üheksa";
  H10 = "kümme";
  H11 = "üks teist";
  H12 = "kaks teist";
  H13 = "kolm teist";
  H14 = "neli teist";
  H15 = "viis teist" ;
  H16 = "kuus teist" ;
  H17 = "seitse teist" ;
  H18 = "kaheksa teist" ;
  H19 = "üheksa teist" ;
  H20 = "kaks kümmend" ;
  H21 = "kaks kümmend üks" ;
  H22 = "kaks kümmend kaks" ;
  H23 = "kaks kümmend kolm" ;
  H24 = "kaks kümmend neli" ;

  MkMinute i = i.s ;

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

  mkNoun : Str -> Case => Str = \w -> table {
    Nom => w ;
    Ad => w + "al"
  } ;

param
  Case = Nom | Ad ;

lin
  DToday t     = "täna" ++ opts (klo ++ t) ;
  DTomorrow t  = "homme" ++ opts (klo ++ t) ;
  DYesterday t = "eile" ++ opts (klo ++ t) ;

}
