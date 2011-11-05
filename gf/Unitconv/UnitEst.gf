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
-- By using the mkUnit-function you can only provide the partitive form,
-- the inessives will be generated automatically.
-- If the single argument mkUnit-function fails to generate the
-- correct forms then specify the other forms explicitly (see some examples in the code)
-- or improve the mkUnit-function to handle the new paradigm.
-- The singular inessiv form is required only in a few cases (e.g. "kilomeetrites *tunnis*"),
-- in most cases it doesn't even end up in the compiled grammar (e.g. JSGF file).
--
-- @author Kaarel Kaljurand
-- @version 2011-11-05

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
prefixed_temperature_unit,
prefixed_area_unit,
prefixed_volume_unit,
prefixed_energy_unit,
prefixed_power_unit,
prefixed_frequency_unit = prefix ;

square = prefix "ruut";
cube = prefix "kuup";

speed, acceleration2 = mk_meter_per_second "";
acceleration = mk_meter_per_second "ruut";

--Length
meter = mkUnit "meetrit";
inch = mkUnit "tolli";
foot = mkUnit "jalga";
yard = mkUnit "jardi";
mile = mkUnit "miili";

--Mass
gram = mkUnit "grammi";
ounce = mkUnit "untsi";
pound = mkUnit "naela";
ton = mkUnit "tonni";
cup_flour = mkUnit "tassi jahu" "jahu tassides";

--Time
-- TODO: take the symbols from PrefixEst
nano_second = mkUnit "nano sekundit";
micro_second = mkUnit "mikro sekundit";
milli_second = mkUnit "milli sekundit";
second = mkUnit "sekundit";
minute = mkUnit "minutit";
hour = mkUnit "tundi" "tunnis" "tundides";
day = mkUnit "päeva";
week = mkUnit "nädalat";
month = mkUnit "kuud";
year = mkUnit "aastat";
decade = mkUnit "dekaadi";
century = mkUnit "sajandit";

--Temperature
celsius = mkUnit "kraadi";

--Area
hectare = mkUnit "hektarit";
acre = mkUnit "aakrit";

--Volume
liter = mkUnit "liitrit";
pint = mkUnit "pinti";
gallon = mkUnit "gallonit";
cup = mkUnit "tassi";

--Frequency
hertz = mkUnit "hertsi";

the_speed_of_light = mkUnit "valgus kiirust";
knot = mkUnit "sõlme";

-- Energy
-- TODO: use Unicode!
joule = mkUnit "dz~auli";
calorie = mkUnit "kalorit";
watt_hour = mkUnit "vatt tundi";

-- Power
watt = mkUnit "vatti";

--Angle
radian = mkUnit "radiaani";
arcsecond = mkUnit "sekundit";
arcminute = mkUnit "minutit";
degree = mkUnit "kraadi";

}
