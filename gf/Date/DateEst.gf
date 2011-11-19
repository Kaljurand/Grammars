concrete DateEst of Date = NumeralEst ** open StringOper in {

flags coding = utf8 ;

lincat
  Date, Year, Day, Time, Minute = Str ;
  Month, Weekday = Case => Str ;
  Hour = PAMPM => Str ;
  Ampm = {s : Str ; p : PAMPM} ;
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

  MkTime ap h m = h ! ap.p ++ (opts m) ++ ap.s ;

  H01 = ampm "üks" "kolm teist" ;
  H02 = ampm "kaks" "neli teist" ;
  H03 = ampm "kolm" "viis teist" ;
  H04 = ampm "neli" "kuus teist" ;
  H05 = ampm "viis" "seitse teist" ;
  H06 = ampm "kuus" "kaheksa teist" ;
  H07 = ampm "seitse" "üheksa teist" ;
  H08 = ampm "kaheksa" "kaks kümmend" ;
  H09 = ampm "üheksa" "kaks kümmend üks" ;
  H10 = ampm "kümme" "kaks kümmend kaks" ;
  H11 = ampm "üksteist" "kaks kümmend kolm" ;
  H12 = ampm "null" "kaks teist" ;  -- 12.01 a.m. = 0.01 ; 12.01 p.m. = 13.01

  MkMinute i = i.s ;

  WSun = mkNoun "pühapäev" ;
  WMon = mkNoun "esmaspäev" ;
  WTue = mkNoun "teisipäev" ;
  WWed = mkNoun "kolmapäev" ;
  WThu = mkNoun "neljapäev" ;
  WFri = mkNoun "reede" ;
  WSat = mkNoun "laupäev" ;

  AM = {s = [] ; p = PAM} ;
  PM = {s = [] ; p = PPM} ;

oper
  opts = optStr ;
  klo = "kell" ;

  ampm : Str -> Str -> PAMPM => Str = \a,p -> table {PAM => a ; PPM => p} ;
  mkNoun : Str -> Case => Str = \w -> table {
    Nom => w ;
    Ad => w + "al"
  } ;

param
  PAMPM = PAM | PPM ;
  Case = Nom | Ad ;

lin
  DToday t     = "täna" ++ opts (klo ++ t) ;
  DTomorrow t  = "homme" ++ opts (klo ++ t) ;
  DYesterday t = "eile" ++ opts (klo ++ t) ;

}
