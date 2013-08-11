concrete TestC3 of Test = {

  param
    Field = P1 | P2 ;

  lincat
    A, B, P = Str ;
    S = Field => Str ;

  lin
    s x = x ! P1 ++ x ! P2 ;
    sA x y = table { P1 => x ; P2 => y } ;
    sB x y = table { P1 => x ; P2 => y } ;
    a = "a" ;
    b = "b" ;
}
