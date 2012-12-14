abstract Dial = Digit ** {

flags startcat = Dial;

cat Dial; Numbers;

fun
	dial : Numbers -> Dial;
	number : Digit__Digit -> Numbers;
	numbers : Digit__Digit -> Numbers -> Numbers;
}
