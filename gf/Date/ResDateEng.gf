resource ResDateEng = NumeralEng ** open StringOper in {

flags coding = utf8 ;

param
  Case = Nom | Ad ;

oper
  opts = optStr ;
  klo = "at" ;

  d1 = mkNum "one" "eleven" "ten" ;
  d2 = mkNum "two" "twelve" "twenty" ;
  d3 = mkNum "three" "thirteen" "thirty" ;
  d4 = mkNum "four" "fourteen" "forty" ;
  d5 = mkNum "five" "fifteen" "fifty" ;
  d6 = regNum "six" ;
  d7 = regNum "seven" ;
  d8 = mkNum "eight" "eighteen" "eighty" ;
  d9 = regNum "nine" ;

  mkUnit : LinDigit -> Str = \x -> x.s ! unit;
  mkTeen : LinDigit -> Str = \x -> x.s ! teen;

  mkTen = overload {
    mkTen : LinDigit -> LinDigit -> Str = \x,y -> x.s ! ten ++ y.s ! unit;
    mkTen : LinDigit -> Str = \x -> x.s ! ten;
  };

  mkNull : LinDigit -> Str = \x -> "oh" ++ x.s ! unit;

  mkNoun : Str -> Case => Str = \w -> table {
    Nom => w ;
    Ad => w + "al"
  } ;

}
