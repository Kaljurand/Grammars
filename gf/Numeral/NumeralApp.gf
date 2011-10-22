concrete NumeralApp of Numeral = open StringOper in {

param Zeros = noz | zz ;

lincat Numeral = { s : Str } ;
lincat Digit = { s : Str } ;
lincat Sub10 = { s : Str } ;
lincat Sub100 = {s : Zeros => Str} ;
lincat Sub1000 = {s : Zeros => Str} ;
lincat Sub1000000 = {s : Zeros => Str} ;

oper mkz : Str -> {s : Zeros => Str} = \s -> {s = table {_ => s}} ;

lin num n = {s = n.s ! noz} ;
lin n2 = ss "2" ;
lin n3 = ss "3" ;
lin n4 = ss "4" ;
lin n5 = ss "5" ;
lin n6 = ss "6" ;
lin n7 = ss "7" ;
lin n8 = ss "8" ;
lin n9 = ss "9" ;

lin pot01 = ss "1" ;
lin pot0 d = d ;

lin pot110 = mkz (glue "1" "0") ;
lin pot111 = mkz (glue "1" "1") ;
lin pot1to19 d = mkz (glue "1" d.s) ;

lin pot0as1 n = {s = table {noz => n.s ; zz => glue "0" n.s}} ;

lin pot1 d = mkz (glue d.s "0") ;
lin pot1plus d e = mkz (glue d.s e.s) ;

lin pot1as2 n = {s = table {noz => n.s ! noz ; zz => glue "0" (n.s ! zz)}} ;
lin pot2 d = mkz (glue d.s "0" "0") ;
lin pot2plus d e = mkz (glue d.s (e.s ! zz)) ;

lin pot2as3 n = {s = table {noz => n.s ! noz ; zz => glue "0" (n.s ! zz)}} ;

lin pot3 n = mkz (glue (n.s ! noz) "0" "0" "0") ;
lin pot3plus n m = {s = table {z => glue (n.s ! z) (m.s ! zz)}} ;

}
