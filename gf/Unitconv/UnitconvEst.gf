concrete UnitconvEst of Unitconv = FractionEst, UnitEst ** open StringOper, Estonian in {

flags coding=utf8;

oper
	c : CaseStr -> CaseStr -> SS
		= \x,y -> { s = x.s ! SgPart ++ y.s ! PlIn };

lincat Unitconv, Conv = SS;

lin
	main num conv = { s = num.s ++ conv.s } ;
	length, mass, time, temperature, area, volume, angle, frequency,
	conv_speed, conv_acceleration,
	conv_energy, conv_power, currency = c ;

}
