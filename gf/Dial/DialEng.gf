concrete DialEng of Dial = DigitEng ** open StringOper in {

flags coding = utf8;

lincat Dial, Numbers = SS;

lin
	dial = prefixSS ("call" | "dial");
	number n = n;
	numbers n = prefixSS n.s;
}
