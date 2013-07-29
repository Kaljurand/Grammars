concrete AddressEst of Address = EepplEst, TallinnstreetEst, TartustreetEst, NumeralEst ** open StringOper in {

flags coding=utf8;

lincat Address, SmallNumeral = SS;

oper
	tallinn = variants { "Tallinn"; [] };
	tartu = "Tartu";

lin
	small_num n = ss (n.s ! indep);

	address0 x = ss x;
	address1 x = ss (x ++ tallinn);
	address2 x y = ss (y ++ x.s ++ tallinn);
	tartu1 x = ss (x ++ tartu);
	tartu2 x y = ss (y ++ x.s ++ tartu);

}
