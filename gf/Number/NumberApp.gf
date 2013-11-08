concrete NumberApp of Number = open StringOper in {

param Zeros = noz | zz ;

lincat Number = { s : Str } ;
lincat Digit = { s : Str } ;
lincat Sub10 = { s : Str } ;
lincat Sub100 = {s : Zeros => Str} ;
lincat Sub1000 = {s : Zeros => Str} ;
lincat Sub1000000 = {s : Zeros => Str} ;
lincat Sub9 = {s : Zeros => Str} ;
lincat Sub12 = {s : Zeros => Str} ;

oper mkz : Str -> {s : Zeros => Str} = \s -> {s = table {_ => s}} ;

oper mkZeros : Str -> Str -> {s : Zeros => Str} = \x,y -> {s = table {
		noz => x ;
		zz => y
	}} ;

oper mkZ3 : {s : Zeros => Str} -> {s : Zeros => Str} = \n ->
	mkZeros (n.s ! noz) (glue "0" "0" "0" (n.s ! zz)) ;

oper mkPlus : {s : Zeros => Str} -> {s : Zeros => Str} -> {s : Zeros => Str} = \n,m ->
	{ s = table { z => glue (n.s ! z) (m.s ! zz) } } ;

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

-- ... -> Sub100
lin pot110 = mkz (glue "1" "0") ;
lin pot111 = mkz (glue "1" "1") ;
lin pot1to19 d = mkz (glue "1" d.s) ;
-- zz: 3 -> 03
lin pot0as1 n = {s = table {noz => n.s ; zz => glue "0" n.s}} ;
lin pot1 d = mkz (glue d.s "0") ;
lin pot1plus d e = mkz (glue d.s e.s) ;

-- Sub100 -> Sub1000
lin pot1as2 n = mkZeros
	(n.s ! noz)
	(glue "0" (n.s ! zz)) ;

-- Sub10 -> Sub1000
lin pot2 d = mkz (glue d.s "0" "0") ;

-- Sub10 -> Sub100 -> Sub1000
lin pot2plus d e = mkz (glue d.s (e.s ! zz)) ;

-- Sub1000 -> Sub1000000
lin pot3 n = mkZeros
	(glue (n.s ! noz) "0" "0" "0")
	(glue (n.s ! zz) "0" "0" "0") ;

-- Sub1000 -> Sub9
lin pot4 n = mkZeros
	(glue (n.s ! noz) (glue "0" "0" "0") (glue "0" "0" "0"))
	(glue (n.s ! zz) (glue "0" "0" "0") (glue "0" "0" "0")) ;

lin pot5 n = mkZeros
	(glue (n.s ! noz) (glue "0" "0" "0") (glue "0" "0" "0") (glue "0" "0" "0"))
	(glue (n.s ! zz)  (glue "0" "0" "0") (glue "0" "0" "0") (glue "0" "0" "0")) ;

-- Sub1000 -> Sub(N) -> Sub(N+3)
lin pot3plus, pot4plus, pot5plus = mkPlus ;

-- Adding the 000-padding.
lin pot2as3, pot3as4, pot4as5 = mkZ3 ;

}
