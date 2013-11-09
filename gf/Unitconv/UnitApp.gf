concrete UnitApp of Unit = PrefixApp, CurrencyApp ** open StringOper in {

flags coding=utf8;

oper

	simple_product : Str -> SS -> SS -> SS
        = \n1,x,y -> ss (glue x.s "*" y.s "^" n1) ;

	product : Str -> Str -> SS -> SS -> SS
        = \n1,n2,x,y -> ss (x.s ++ "^" ++ n1 ++ "*" ++ y.s ++ "^" ++ n2) ;


lincat
	DensityUnit,
	Length, LengthUnit,
	Mass, MassUnit,
	Time, TimeUnit,
	Temperature, TemperatureUnit,
	Area, AreaUnit,
	Volume, VolumeUnit,
	Frequency, FrequencyUnit,
	Speed, SpeedUnit,
	AccelerationUnit,
	Energy, EnergyUnit,
	Power, PowerUnit,
	AngleUnit = SS;

lin

length_unit, mass_unit, time_unit, temperature_unit,
area_unit,
volume_unit,
frequency_unit,
speed_unit,
energy_unit,
power_unit = id SS;

prefixed_length_unit, prefixed_mass_unit,
prefixed_area_unit, prefixed_volume_unit,
prefixed_energy_unit,
prefixed_power_unit,
prefixed_frequency_unit = prefixSS_glue ;

square = postfixSS_glue "^2";
cube = postfixSS_glue "^3";

density, speed = infixSS_glue "/";
--acceleration = product "1" "-2";
acceleration = simple_product "-2";

acceleration2 x y = ss (glue x.s "/" y.s);

--Length
meter = ss "m";
foot = ss "ft";
mile = ss "mi";
inch = ss "in";
yard = ss "yd";

--Mass
gram = ss "g";
ounce = ss "oz";
pound = ss "lb";
ton = ss "t";
cup_flour = ss "flour-cup";

--Time
-- TODO: take the symbols from PrefixApp
nano_second = ss "ns";
micro_second = ss "µs";
milli_second = ss "ms";
second = ss "s";
minute = ss "min";
hour = ss "h";
day = ss "day";
week = ss "week";
month = ss "month";
year = ss "year";
decade = ss "decade";
century = ss "century";


--Temperature
celsius = ss "°C";
fahrenheit = ss "°F";

--Area
hectare = ss "ha";
acre = ss "acre";


--Volume
liter = ss "L";
pint = ss "pt";
gallon = ss "gal";
cup = ss "cup_us";
fluid_ounce = ss "fl oz";

--Frequency
hertz = ss "Hz";

--Speed
the_speed_of_light = ss "c";
knot = ss "knot";

-- Energy
joule = ss "J";
calorie = ss "cal";
watt_hour = infixSS_glue "⋅" watt hour;
-- TODO: glue does not seem to work with empty strings
--watt_hour = infixSS_glue "" watt hour;

-- Power
watt = ss "W";

--Angle
radian = ss "rad";
arcsecond = ss "\"";
arcminute = ss "'";
degree = ss "°";

}
