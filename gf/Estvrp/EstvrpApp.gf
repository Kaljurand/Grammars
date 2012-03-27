concrete EstvrpApp of Estvrp = DigitApp, LetterApp ** open StringOper in {

flags coding = utf8;

lincat Estvrp = SS;

lin
	estvrp d1 d2 d3 l1 l2 l3 = ss (d1.s ++ d2.s ++ d3.s ++ l1 ++ l2 ++ l3);
}
