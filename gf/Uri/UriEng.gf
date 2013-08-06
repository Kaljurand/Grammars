concrete UriEng of Uri = ISO639Eng, FractionEng - [pi] ** open StringOper in {

flags coding = utf8;

lincat Uri = SS;

lin
	wikipedia lang = ss (lang ++ "Wikipedia") ;
	geo lat lon zoom = ss ("coordinates" ++ lat.s ++ lon.s ++ zoom.s) ;

}
