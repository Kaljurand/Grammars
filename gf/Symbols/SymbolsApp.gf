concrete SymbolsApp of Symbols = DigitApp, LetterApp ** open StringOper in {

lincat Symbols = SS;

lin
	empty = ss "";
	digit, letter = prefixSS;
}
