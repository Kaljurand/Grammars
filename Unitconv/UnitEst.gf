concrete UnitEst of Unit = PrefixEst ** open StringOper in {

-- This is a lexicon of the words of measurement units in Estonian.
-- In principle two forms of each word must be provided
-- (singular partitiv and plural inessiv), but using the mk-function
-- you can only provide the partitive form, the inessive will be
-- generated automatically. If the mk-function fails to generate the
-- correct inessive form then use the f-function to provide both forms
-- (or improve the mk-function to handle the new paradigm).

flags coding=utf8;

param Case = SgPart | PlIn ;

-- The f-function requires both forms (`SgPart` and `PlIn`)
-- The mk-function is smart and only requires the "base" form (`SgPart`)
oper
	CaseStr : Type = { s : Case => Str } ;

	prefix : Str -> CaseStr -> CaseStr = \x,y -> add_prefix x y;

	f : Str -> Str -> CaseStr = \x,y ->
		{ s = table { SgPart => x ; PlIn => y } };
	mk : Str -> CaseStr = \w -> 
		let 
			ws : Str = case w of {
				_ + ("a" | "e" | "i" | "o") => w + "des" ; -- jalga + des
				_                           => w + "es"    -- liitrit + es
			} 
		in f w ws;

	-- Places a prefix (`kilo`) in front of the given unit word (`meeter`).
	-- TODO: Maybe we should return a more complex structure with a field
	-- for the prefix, instead of doing string concatenation here.
	add_prefix : Str -> CaseStr -> CaseStr = \p,w ->
		{ s = table { SgPart => p ++ (w.s ! SgPart) ; PlIn => p ++ (w.s ! PlIn) } };

lincat
	Length, LengthUnit,
	Mass, MassUnit,
	Time, TimeUnit,
	Temperature, TemperatureUnit,
	AreaUnit, VolumeUnit, AngleUnit = CaseStr;

lin

length_unit, mass_unit, time_unit, temperature_unit = id CaseStr ;
prefixed_length_unit, prefixed_mass_unit, prefixed_time_unit, prefixed_temperature_unit = prefix ;

--Length
meter = mk "meetrit";
foot = mk "jalga";

--Mass
gram = mk "grammi";
cup_flour = f "tassi jahu" "jahu tassides";

--Time
second = mk "sekundit";
minute = mk "minutit";
hour = mk "tundi";

--Temperature
celsius = mk "kraadi";

--Area
hectare = mk "hektarit";
square_meter = mk "ruut meetrit";
square_kilo_meter = mk "ruut kilo meetrit";

--Volume
liter = mk "liitrit";
cubic_foot = mk "kuup jalga";
cup = mk "tassi";

--Angle
--radian = mk "radiaani";
arcsecond = mk "sekundit";
arcminute = mk "minutit";
degree = mk "kraadi";
}
