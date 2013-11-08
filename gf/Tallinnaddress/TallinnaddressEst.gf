concrete TallinnaddressEst of Tallinnaddress = TallinnplaceEst, TallinnstreetEst, NumberEst ** open StringOper in {

flags coding=utf8;

lincat Tallinnaddress, SmallNumeral = SS;


lin
	small_num n = ss (n.s ! indep);

	address0, address1 = ss;
	address2 x y = ss (y ++ x.s);
}
