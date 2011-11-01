concrete TallinndirectionEdwin of Tallinndirection = TallinndirectionApp - [direction_id, direction] ** open StringOper in {

flags coding=utf8;

lin
	direction_id x = ss ("map" ++ x.s);

	-- Edwin does not seem to be able to do "FROM-TO" queries,
	-- but only "your current location - TO" queries.
	-- BUG: we just ignore the TO argument for the time being
	direction _ y = ss ("get directions to" ++ y.s);
}
