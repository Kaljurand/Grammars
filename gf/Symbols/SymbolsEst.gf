concrete SymbolsEst of Symbols = DigitEst, LetterEst ** open StringOper in {

lincat Symbols = SS;

lin
	empty = ss "";
	letter = prefixSS;
	digit d = prefixSS d.s;
}
