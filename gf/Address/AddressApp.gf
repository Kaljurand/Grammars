concrete AddressApp of Address = EepplEst, TownEst, StreetFEst, NumeralApp ** open StringOper in {

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

lin
	small_num n = {s = n.s ! noz} ;
	address0 x = ss (x ++ "," ++ "Estonia");
	address1 x y = ss (x ++ "," ++ y);
	address2 x y z = ss (y ++ x.s ++ "," ++ z);
}
