concrete AddressEst of Address = TownEst, StreetFEst, estonian ** open StringOper in {

flags coding=utf8;

lincat Address = SS;

lin
	address1 x y = ss (x ++ y);
	address2 x y z = ss (x ++ y.s ++ z);
}
