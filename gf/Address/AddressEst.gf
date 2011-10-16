concrete AddressEst of Address = EepplEst, TownEst - [tallinn], StreetFEst, estonian ** open StringOper in {

flags coding=utf8;

lincat Address, SmallNumeral = SS;


lin
	small_num n = ss (n.s ! indep);

	address0 x = ss x;
	address1 x y = ss (x ++ y);
	address2 x y z = ss (y ++ x.s ++ z);

	-- In the context of addresses, when you say nothing
	-- you actually mean "Tallinn".
	tallinn = variants { "Tallinn"; [] };
}
