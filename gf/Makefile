
path = lib:Numeral:Date:Dial:Digit:Action:Alarm:Calc:Expr:Fraction:Unitconv:Direction:Address:Eeppl:Tallinnaddress

langs = App Est Eng

# Modules reachable from Action
modules_Action=Action,Address,Alarm,Calc,Currency,Date,Dial,Digit,Direction,Eeppl,Estvrp,Expr,Fraction,Go,Letter,Numeral,Prefix,Symbols,Tallinnaddress,Tallinndirection,Town,Unit,Unitconv

gf = gf --make --optimize-pgf --mk-index --path=$(path)
gf_retain = gf --run --retain --path=$(path)
gfdepgraph = _gfdepgraph.dot


dg_Action:
	echo "dg -only=$(modules_Action)" | $(gf_retain) $(foreach lang,$(langs),Action/Action$(lang).gf)
	dot -Tpng $(gfdepgraph) > Action.png
	rm $(gfdepgraph)
	eog Action.png

build_Action:
	$(gf) $(foreach lang,$(langs),Action/Action$(lang).gf)

build_Calc:
	$(gf) $(foreach lang,$(langs),Calc/Calc$(lang).gf)

build_Expr:
	$(gf) $(foreach lang,$(langs),Expr/Expr$(lang).gf)

build_Unitconv:
	$(gf) $(foreach lang,$(langs),Unitconv/Unitconv$(lang).gf)

build_Unitconvext:
	$(gf) $(foreach lang,$(langs),Unitconvext/Unitconvext$(lang).gf)

build_Fraction:
	$(gf) $(foreach lang,$(langs),Fraction/Fraction$(lang).gf)

build_Numeral:
	$(gf) $(foreach lang,$(langs),Numeral/Numeral$(lang).gf)

build_Date:
	$(gf) $(foreach lang,$(langs),Date/Date$(lang).gf)

build_Dial:
	$(gf) $(foreach lang,$(langs),Dial/Dial$(lang).gf)

build_Alarm:
	$(gf) $(foreach lang,$(langs),Alarm/Alarm$(lang).gf)

commit:
	git commit -a -m "f"
