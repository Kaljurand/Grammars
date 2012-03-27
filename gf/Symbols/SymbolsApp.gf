concrete SymbolsApp of Symbols = DigitApp, LetterApp ** open StringOper in {

lincat Symbols = SS;

lin
	empty = ss "";
	letter = prefixSS;
	digit d = prefixSS d.s;
}
