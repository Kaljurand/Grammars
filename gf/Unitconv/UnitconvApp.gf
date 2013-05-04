concrete UnitconvApp of Unitconv = FractionApp, UnitApp ** open StringOper in {

oper
	c : SS -> SS -> SS
		= \x,y -> { s = x.s ++ "to" ++ y.s };

lincat Unitconv, Conv = SS ;

lin
	main num conv = {s = "convert" ++ num.s ++ conv.s} ;

	length, mass, time, temperature, area, volume, angle, frequency,
	conv_speed, conv_acceleration,
	conv_energy, conv_power,
	currency = c ;

}
