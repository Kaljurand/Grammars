resource Estonian = {

-- @author Kaarel Kaljurand
-- @version 2011-10-05

flags coding=utf8;

param Case = SgPart | SgIn | PlIn ;

-- The f-function requires both forms (`SgPart` and `PlIn`)
-- The mk-function is smart and only requires the "base" form (`SgPart`)
oper
	CaseStr : Type = { s : Case => Str } ;

	prefix : Str -> CaseStr -> CaseStr = \x,y -> add_prefix x y;

	mkUnit = overload {
		mkUnit : (x1 : Str) -> CaseStr = mk ;
		mkUnit : (x1,x2 : Str) -> CaseStr = f ;
		mkUnit : (x1,x2,x3 : Str) -> CaseStr = f3 ;
	};


	f3 : Str -> Str -> Str -> CaseStr = \sg1,sg2,pl1 ->
		{
			s = table {
				SgPart => sg1 ;
				SgIn => sg2 ;
				PlIn => pl1
			}
	};

	f : Str -> Str -> CaseStr = \x,y -> f3 x "NOT_IMPLEMENTED" y;

	mk : Str -> CaseStr = \sg_part -> 
		let 
			pl_in : Str = case sg_part of {
				_ + ("a" | "e" | "i" | "o") => sg_part + "des" ; -- jalga + des
				_                           => sg_part + "es"    -- liitrit + es
			} ;
			sg_in : Str = case sg_part of {
				base + ("t" | "d")          => base + "s" ; -- sekundit -> sekundis
				_                           => sg_part + "s" -- raha + s
			} 
		in f3 sg_part sg_in pl_in;

	-- Places a prefix (`kilo`) in front of the given unit word (`meeter`).
	-- TODO: Maybe we should return a more complex structure with a field
	-- for the prefix, instead of doing string concatenation here.
	add_prefix : Str -> CaseStr -> CaseStr = \p,w ->
		{
			s = table {
				SgPart => p ++ (w.s ! SgPart) ;
				SgIn => p ++ (w.s ! SgIn) ;
				PlIn => p ++ (w.s ! PlIn)
			}
	};

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

}
