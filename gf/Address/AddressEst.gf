concrete AddressEst of Address = TownEst - [tallinn], StreetFEst, estonian ** open StringOper in {

flags coding=utf8;

lincat Address, SmallNumeral = SS;


lin
	small_num n = {s = (n.s ! indep)} ;

	address1 x y = ss (x ++ y);
	address2 x y z = ss (x ++ y.s ++ z);

	-- In the context of addresses, when you say nothing
	-- you actually mean "Tallinn".
	tallinn = variants { "Tallinn"; [] };
}
