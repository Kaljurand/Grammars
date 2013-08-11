concrete UnitconvEng of Unitconv = FractionEng, UnitEng ** open StringOper, English in {

flags coding=utf8;

lincat Unitconv, Conv = SS ;

lin
	main num conv = ss (num.s ++ conv.s) ;
	length, mass, time, temperature, area, volume, angle, frequency,
	conv_density, conv_speed, conv_acceleration,
	conv_energy, conv_power, currency = infixSS ("in" | "to") ;

}
