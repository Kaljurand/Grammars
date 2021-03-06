abstract Unitconvext = Unitconv ** {

flags startcat = Unitconv ;

cat
	Unitconv ;
	FractionD ;

fun
	fraction_default : FractionD;
	fraction_copy : Fraction -> FractionD;

	-- TODO: this could cover all possible type pairs
	general :
		FractionD -> CurrencyUnit -> FractionD -> TimeUnit ->
		FractionD -> CurrencyUnit -> FractionD -> TimeUnit -> Unitconv ;

}
