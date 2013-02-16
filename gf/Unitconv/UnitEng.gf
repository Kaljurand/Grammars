concrete UnitEng of Unit = PrefixEng, CurrencyEng ** open StringOper, English in {

-- @author Kaarel Kaljurand
-- @version 2012-09-26

flags coding=utf8;

lincat
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
prefixed_area_unit,
prefixed_volume_unit,
prefixed_energy_unit,
prefixed_power_unit,
prefixed_frequency_unit = prefixSS ;

square = prefixSS "square";
cube = prefixSS "cubic";

speed, acceleration2 = mkMeterPerSecond "";
acceleration = mkMeterPerSecond "squared";

--Length
meter = mkUnit "meters";
inch = mkUnit "inches";
foot = mkUnit "feet";
yard = mkUnit "yards";
mile = mkUnit "miles";

--Mass
gram = mkUnit "grams";
ounce = mkUnit "ounces";
pound = mkUnit "pounds";
ton = mkUnit "tons";
cup_flour = mkUnit "cups of flour";

--Time
nano_second = mkUnit "nano seconds";
micro_second = mkUnit "micro seconds";
milli_second = mkUnit "milli seconds";
second = mkUnit "seconds";
minute = mkUnit "minutes";
hour = mkUnit "hours";
day = mkUnit "days";
week = mkUnit "weeks";
month = mkUnit "months";
year = mkUnit "years";
decade = mkUnit "decades";
century = mkUnit "centuries";

--Temperature
celsius = optPrePostSS "degrees" (mkUnit "Celcius");
fahrenheit = optPrePostSS "degrees" (mkUnit "Fahrenheits");

--Area
hectare = mkUnit "hectares";
acre = mkUnit "acres";

--Volume
liter = mkUnit "liters";
pint = mkUnit "pints";
gallon = mkUnit "gallons";
cup = mkUnit "cups";

--Frequency
hertz = mkUnit "hertz";

the_speed_of_light = mkUnit "speed of light";
knot = mkUnit "knots";

-- Energy
joule = mkUnit "joules";
calorie = mkUnit "calories";
watt_hour = mkUnit "watt hours";

-- Power
watt = mkUnit "watts";

--Angle
radian = mkUnit "radians";
arcsecond = mkUnit "seconds";
arcminute = mkUnit "minutes";
degree = mkUnit "degrees";

}
