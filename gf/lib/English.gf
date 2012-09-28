resource English = open StringOper in {

flags coding=utf8;

oper

    mkUnit = overload {
        mkUnit : (x : Str) -> SS = ss;
    };

    mkMeterPerSecond : Str -> SS -> SS -> SS = \p,x,y ->
        { s = x.s ++ "per" ++ y.s ++ p };

}
