resource Estonian = open StringOper, CatEst, ResEst, ParadigmsEst in {

-- @author Kaarel Kaljurand
-- @version 2013-10-10

flags coding=utf8;

param Case = SgPart | SgIn | PlIn ;

-- The f-function requires both forms (`SgPart` and `PlIn`)
-- The mk-function is smart and only requires the "base" form (`SgPart`)
oper
	CaseStr : Type = { s : Case => Str } ;

	prefix : Str -> CaseStr -> CaseStr = \x,y -> add_prefix x y;

	mkUnit = overload {
		mkUnit : (x1 : Str) -> CaseStr = mk1 ;
		mkUnit : (x1,x2 : Str) -> CaseStr = mk2 ;
		mkUnit : (x1,x2,x3 : Str) -> CaseStr = mk3 ;
	};


	request : Str -> Str = \x -> (x ++ strOpt "palun") | "palun" ++ x;


	mkForms : Str -> Str -> Str -> CaseStr = \sg1,sg2,pl1 ->
		{
			s = table {
				SgPart => sg1 ;
				SgIn => sg2 ;
				PlIn => pl1
			}
	};

	mk1 : Str -> CaseStr = \sg_nom ->
		let
			n : N = mkN sg_nom ;
			sg_part : Str = (n.s ! NCase Sg Part) ;
			sg_in : Str = (n.s ! NCase Sg Iness) ;
			pl_in : Str = (n.s ! NCase Pl Iness)
		in mkForms sg_part sg_in pl_in ;

	mk2 : Str -> Str -> CaseStr = \sg_nom,sg_gen ->
		let
			n : N = mkN sg_nom sg_gen ;
			sg_part : Str = (n.s ! NCase Sg Part) ;
			sg_in : Str = (n.s ! NCase Sg Iness) ;
			pl_in : Str = (n.s ! NCase Pl Iness)
		in mkForms sg_part sg_in pl_in ;

	mk3 : Str -> Str -> Str -> CaseStr = \nom,gen,part ->
		let
			n : N = mkN nom gen part ;
			sg_in : Str = (n.s ! NCase Sg Iness) ;
			pl_in : Str = (n.s ! NCase Pl Iness)
		in mkForms part sg_in pl_in ;

	-- Places a prefix (`kilo`) in front of the given unit word (`meeter`).
	-- TODO: Maybe we should return a more complex structure with a field
	-- for the prefix, instead of doing string concatenation here.
	add_prefix : Str -> CaseStr -> CaseStr = \p,w ->
		{ s = \\c => p ++ (w.s ! c) } ;

	-- Note that the compound expressions do not have the SgIn-form
	-- so we will not implement it:
	-- SgPart: (kolm) meetrit sekundis
	-- PlIn: meetrites sekundis
	-- SgIn: * meetris sekundis
	-- Note the first argument is used to provide "ruut" in case of
	-- "meetrit ruut sekundis".
	-- Note that we can use the resulting CaseStr as the 1st CaseStr argument, e.g.:
	-- Pass 1 (constructing speed):
	-- SgPart: meetrit (SgPart) sekundis (SgIn)
	-- PlIn: meetrites (PlIn) sekundis (SgIn)
	-- Pass 2 (constructing acceleration from speed):
	-- SgPart: meetrit sekundis (SgPart) sekundis (SgIn)
	-- PlIn : meetrites sekundis (PlIn) sekundis (SgIn)
	mk_meter_per_second : Str -> CaseStr -> CaseStr -> CaseStr = \p,x,y ->
		{
			s = table {
				SgPart => (x.s ! SgPart) ++ p ++ (y.s ! SgIn) ;
				PlIn => (x.s ! PlIn) ++ p ++ (y.s ! SgIn) ;
				_ => "NOT_NEEDED"
			}
		};


	-- Estonian digits
	d0 = "null";
	d1 = "üks";
	d2 = "kaks";
	d3 = "kolm";
	d4 = "neli";
	d5 = "viis";
	d6 = "kuus";
	d7 = "seitse";
	d8 = "kaheksa";
	d9 = "üheksa";
}
