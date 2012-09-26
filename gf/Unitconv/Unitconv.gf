abstract Unitconv = Fraction, Unit ** {

flags startcat = Main ;

cat
	Main ;
	Conv ;
	FractionD ;

fun
	-- Quantified unit conversion
	main : Fraction -> Conv -> Main ;

	fraction_default : FractionD;
	fraction_copy : Fraction -> FractionD;

	-- TODO: this should cover all possible type pairs
	-- TODO: move this to another grammar. This expression
	-- is relatively complex so it will be linearized as a sentence.
	-- As Calc optionally adds the "how much is" prefix we currently
	-- get incorrect syntax.
	general :
		FractionD -> CurrencyUnit -> FractionD -> TimeUnit ->
		FractionD -> CurrencyUnit -> FractionD -> TimeUnit -> Main ;

	-- Type-aware unit conversion
	-- TODO: use dependent types

	-- SI base units
	length : LengthUnit -> LengthUnit -> Conv ;
	mass : MassUnit -> MassUnit -> Conv ;
	time : TimeUnit -> TimeUnit -> Conv ;
	-- electric_current
	temperature: TemperatureUnit -> TemperatureUnit -> Conv ;
	-- amount of substance
	-- luminous intensity

	-- SI derived units
	area : AreaUnit -> AreaUnit -> Conv ;
	volume : VolumeUnit -> VolumeUnit -> Conv ;
	angle : AngleUnit -> AngleUnit -> Conv ;

	frequency : FrequencyUnit -> FrequencyUnit -> Conv ;
	conv_speed : SpeedUnit -> SpeedUnit -> Conv ;
	conv_acceleration : AccelerationUnit -> AccelerationUnit -> Conv ;
	conv_energy : EnergyUnit -> EnergyUnit -> Conv ;
	conv_power : PowerUnit -> PowerUnit -> Conv ;

	-- Currency conversion
	currency : CurrencyUnit -> CurrencyUnit -> Conv ;

}
