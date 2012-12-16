resource English = open StringOper in {

flags coding=utf8;

oper

	requestSS : SS -> SS = prefixSS (optStr "please") ;

    mkUnit = overload {
        mkUnit : (x : Str) -> SS = ss;
    };

    mkMeterPerSecond : Str -> SS -> SS -> SS = \p,x,y ->
        { s = x.s ++ "per" ++ y.s ++ p };

	-- English digits
	d0 = "zero";
	d1 = "one";
	d2 = "two";
	d3 = "three";
	d4 = "four";
	d5 = "five";
	d6 = "six";
	d7 = "seven";
	d8 = "eight";
	d9 = "nine";
}
