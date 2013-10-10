concrete UnitEst of Unit = PrefixEst, CurrencyEst ** open StringOper, Estonian in {

-- This is a lexicon of the words of measurement units in Estonian.
-- Some examples:
--   * meetrit
--   * kilo meetrit
--   * ruut meetrit
--   * ruut kilo meetrit
--   * meetrit sekundis
--   * kilo meetrit sekundis
--   * kilo meetrit milli sekundis
--   * kilo meetrit ruut milli sekundis
--   * meetrit sekundis sekundis [= (m/s)/s]
-- For the currency examples see `CurrencyEst`.
--
-- Internally three forms of each word are used:
--   * singular partitiv (SgPart),
--   * singular inessiv (SgIn),
--   * plural inessiv (PlIn).
-- By using the mkUnit-function you must usually provide only the sg nom form.
-- The sg iness form is required only in a few cases (e.g. "kilomeetrites *tunnis*"),
-- in most cases it doesn't even end up in the compiled grammar (e.g. JSGF file).
--
-- TODO: remove the need for mkForms
--
-- @author Kaarel Kaljurand
-- @version 2013-10-10

flags coding=utf8;

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
	AngleUnit = CaseStr;

lin

length_unit, mass_unit, time_unit, temperature_unit,
area_unit,
volume_unit,
frequency_unit,
speed_unit,
energy_unit,
power_unit = id CaseStr ;

prefixed_length_unit, prefixed_mass_unit,
prefixed_area_unit,
prefixed_volume_unit,
prefixed_energy_unit,
prefixed_power_unit,
prefixed_frequency_unit = prefix ;

square = prefix "ruut";
cube = prefix "kuup";

density, speed, acceleration2 = mk_meter_per_second "";
acceleration = mk_meter_per_second "ruut";

--Length
meter = mkUnit "meeter";
inch = mkUnit "toll";
foot = mkUnit "jalg" "jala" "jalga";
yard = mkUnit "jard";
mile = mkUnit "miil";

--Mass
gram = mkUnit "gramm";
ounce = mkUnit "unts";
pound = mkForms "naela" "naelas" "naelades";
ton = mkUnit "tonn";
cup_flour = mkForms "tassi jahu" "jahu tassis" "jahu tassides";

--Time
-- TODO: take the symbols from PrefixEst
nano_second = prefix "nano" second;
micro_second = prefix "mikro" second;
milli_second = prefix "milli" second;
second = mkUnit "sekund";
minute = mkUnit "minut";
hour = mkUnit "tund" "tunni" "tundi";
day = mkUnit "päev" "päeva" "päeva";
week = mkUnit "nädal" "nädala" "nädalat";
month = mkUnit "kuu";
year = mkUnit "aasta";
decade = mkUnit "dekaad";
century = mkUnit "sajand";

--Temperature
celsius = degree | mkUnit "celsius" ;
fahrenheit = mkUnit "fahrenheit";

--Area
hectare = mkUnit "hektar";
acre = mkUnit "aaker";

--Volume
liter = mkUnit "liiter";
pint = mkUnit "pint";
gallon = mkUnit "gallon";
cup = mkUnit "tass";

--Frequency
hertz = mkUnit "herts";

the_speed_of_light = mkForms "valgus kiirust" "valgus kiiruses" "valgus kiirustes" ;
knot = mkUnit "sõlm" "sõlme" "sõlme";

-- Energy
joule = mkUnit "džaul";
calorie = mkUnit "kalor";
watt_hour = prefix "vatt" hour;

-- Power
watt = mkUnit "vatt";

--Angle
radian = mkUnit "radiaan";
arcsecond = second;
arcminute = minute;
degree = mkUnit "kraad";

}
