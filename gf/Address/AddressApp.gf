concrete AddressApp of Address = EepplEst, TallinnstreetEst, TartustreetEst, NumeralApp ** open StringOper in {

-- AddressApp refers to the Google Maps query language
-- which has the following features:
--
--   * Estonian town and street names
--   * "decimal" numerals
--   * comma between administrative levels (street, town, country)
--   * disambiguation of Eeppl-names, e.g. instead of "Pariisi" we have "Pariisi, Estonia",
--     because the former might be disambiguated by Google Maps as "Pariisi, Ranska"

flags coding=utf8;

lincat Address, SmallNumeral = SS;

oper
    estonia = ", Estonia";
    tallinn = ", Tallinn";
    tartu = ", Tartu";

lin
	small_num n = {s = n.s ! noz} ;
	address0 x = ss (x ++ estonia);
	address1 x = ss (x ++ tallinn);
	address2 x y = ss (y ++ x.s ++ tallinn);
	tartu1 x = ss (x ++ tartu);
	tartu2 x y = ss (y ++ x.s ++ tartu);
}
