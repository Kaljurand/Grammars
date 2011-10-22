concrete NumeralEst of Numeral = {

-- This is a port of examples/numerals/finnish.gf (GF v3.2.9) to Estonian.
--
-- Note: this grammar does not glue -teist, -kümmend, ja -sada, which is
-- orthographically incorrect but more suitable for the Estonian speech recognizer.
--
-- Note: this grammar supports "tuhat sada" and does not support "tuhat üks sada".
--
-- @author Kaarel Kaljurand
-- @version 2011-10-22

flags coding=utf8;

param Place = indep | attr ;
param Nm = sg | pl ;
lincat Numeral = {s : Str} ;
lincat Digit = {s : Str} ;
lincat Sub10 = {s : Place => Str} ;
lincat Sub100 = {s : Place => Str} ;
lincat Sub1000 = {s : Place => Str} ;
lincat Sub1000000 = {s : Str} ;
lin num x0 =
  {s = x0.s} ;
lin n2 =
  {s = "kaks"} ;
lin n3 =
  {s = "kolm"} ;
lin n4 =
  {s = "neli"} ;
lin n5 =
  {s = "viis"} ;
lin n6 =
  {s = "kuus"} ;
lin n7 =
  {s = "seitse"} ;
lin n8 =
  {s = "kaheksa"} ;
lin n9 =
  {s = "üheksa"} ;
lin pot01 =
  {s = table {attr => [] ; indep => "üks"}} ;
lin pot0 d =
  {s = table {p => d.s}} ;
lin pot110 =
  {s = table {p => "kümme"}} ;
lin pot111 =
  {s = table {p => "üks" ++ "teist"}} ;
lin pot1to19 d =
  {s = table {p => d.s ++ "teist"}} ;
lin pot0as1 n =
  {s = table {p => n.s ! p}} ;
lin pot1 d =
  {s = table {p => d.s ++ "kümmend"}} ;
lin pot1plus d e =
  {s = table {p => d.s ++ "kümmend" ++ e.s ! indep}} ;
lin pot1as2 n =
  {s = table {p => n.s ! p}} ;
lin pot2 d =
  {s = table {p => (d.s ! attr) ++ "sada" }} ;
lin pot2plus d e =
  {s = table {p => (d.s ! attr) ++ "sada" ++ e.s ! indep}} ;
lin pot2as3 n =
  {s = n.s ! indep} ;
lin pot3 n =
  {s = (n.s ! attr) ++ "tuhat"} ;
lin pot3plus n m =
  {s = (n.s ! attr) ++ "tuhat" ++ m.s ! indep} ;

}
