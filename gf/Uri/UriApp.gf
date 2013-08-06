concrete UriApp of Uri = ISO639App, FractionApp - [pi, neg1, neg2] ** open StringOper in {

flags coding = utf8;

lincat Uri = SS;

lin
	wikipedia lang = ss (glue "http://" lang ".wikipedia.org/wiki/Main_Page") ;

	-- http://developer.android.com/guide/appendix/g-app-intents.html
	-- geo:latitude,longitude?z=zoom
	neg1 x = prefixSS_glue "-" x ;
	neg2 x = prefixSS_glue "-" x ;
	geo lat lon zoom = ss (glue "geo:" lat.s "," lon.s "?z=" (zoom.s ! noz)) ;

}
