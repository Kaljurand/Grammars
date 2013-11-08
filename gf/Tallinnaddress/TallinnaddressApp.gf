concrete TallinnaddressApp of Tallinnaddress = TallinnplaceEst, TallinnstreetEst, NumberApp ** open StringOper in {

-- TallinnaddressApp refers to the Google Maps query language
-- which has the following features:
--
--   * Estonian place/street names
--   * "decimal" numerals
--   * comma between place/street name and "Tallinn"

flags coding=utf8;

lincat Tallinnaddress, SmallNumeral = SS;

lin
	small_num n = {s = n.s ! noz} ;
	address0 x = ss (x ++ "," ++ "Tallinn");
	address1 x = ss (x ++ "," ++ "Tallinn");
	address2 x y = ss (y ++ x.s ++ "," ++ "Tallinn");
}
