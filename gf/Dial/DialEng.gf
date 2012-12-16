concrete DialEng of Dial = DigitEng ** open StringOper, English in {

flags coding = utf8;

lincat Dial, Numbers = SS;

lin
	dial n = requestSS (prefixSS ("call" | "dial") n);
	number n = n;
	numbers n = prefixSS n.s;
}
