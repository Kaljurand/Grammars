abstract Dial = Digit ** {

flags startcat = Dial;

cat Dial; Numbers;

fun
	dial : Numbers -> Dial;
	number : Digit -> Numbers;
	numbers : Digit -> Numbers -> Numbers;
}
