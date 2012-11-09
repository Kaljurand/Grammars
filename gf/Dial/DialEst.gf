concrete DialEst of Dial = DigitEst ** open StringOper, Estonian in {

flags coding = utf8;

lincat Dial, Numbers = SS;

lin
	dial = prefixSS (request ("helista" | "vali"));
	number n = n ;
	numbers n = prefixSS n.s;
}
