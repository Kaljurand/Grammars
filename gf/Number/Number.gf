abstract Number = {

-- numerals from 1 to (10^12 - 1) in decimal notation

flags startcat=Number;

cat
  Number ;      -- 0..
  Digit ;       -- 2..9
  Sub10 ;       -- 1..9
  Sub100 ;      -- 1..99
  Sub1000 ;     -- 1..999
  Sub1000000 ;  -- 1..999999
  Sub9 ;        -- 1..999999999 (billion - 1)
  Sub12 ;       -- 1..10^12 -1 (trillion - 1)

fun
  num : Sub12 -> Number ;

  n2, n3, n4, n5, n6, n7, n8, n9 : Digit ;

  pot01 : Sub10 ;                               -- 1
  pot0 : Digit -> Sub10 ;                       -- d * 1
  pot110 : Sub100 ;                             -- 10
  pot111 : Sub100 ;                             -- 11
  pot1to19 : Digit -> Sub100 ;                  -- 10 + d
  pot0as1 : Sub10 -> Sub100 ;                   -- coercion of 1..9
  pot1 : Digit -> Sub100 ;                      -- d * 10
  pot1plus : Digit -> Sub10 -> Sub100 ;         -- d * 10 + n

  pot1as2 : Sub100 -> Sub1000 ;                 -- coercion of 1..99
  pot2 : Sub10 -> Sub1000 ;                     -- m * 100
  pot2plus : Sub10 -> Sub100 -> Sub1000 ;       -- m * 100 + n

  pot2as3 : Sub1000 -> Sub1000000 ;             -- coercion of 1..999
  pot3 : Sub1000 -> Sub1000000 ;                -- m * 1000
  pot3plus : Sub1000 -> Sub1000 -> Sub1000000 ; -- m * 1000 + n

  pot3as4 : Sub1000000 -> Sub9 ;
  pot4 : Sub1000 -> Sub9 ;
  pot4plus : Sub1000 -> Sub1000000 -> Sub9 ;

  pot4as5 : Sub9 -> Sub12 ;
  pot5 : Sub1000 -> Sub12 ;
  pot5plus : Sub1000 -> Sub9 -> Sub12 ;

}
