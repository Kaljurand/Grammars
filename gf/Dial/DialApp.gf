concrete DialApp of Dial = DigitApp ** open StringOper in {

flags coding = utf8;

lincat Dial, Numbers = SS;

lin
	dial = prefixSS "call";
	number n = n ;
	numbers n = prefixSS n.s;
}
