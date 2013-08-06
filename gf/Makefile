
path = lib:Numeral:Date:Dial:Digit:Action:Alarm:ArithExpr:Calc:Expr:Fraction:ISO639:Unitconv:Direction:Address:Eeppl:Tallinnaddress:Uri:Weather

langs = App Est Eng
langs1 = App Est
langs2 = App Est Esttts Eng Engtts

# Modules reachable from Action
modules_Action=Action,Address,Alarm,ArithExpr,Calc,Currency,Date,Dial,Digit,Direction,Eeppl,Estvrp,Expr,Fraction,Go,Letter,Numeral,Prefix,Symbols,Tallinnaddress,Tallinndirection,Unit,Unitconv,Weather

gf = gf --make --optimize-pgf --mk-index --path=$(path)
gf_retain = gf --run --retain --path=$(path)
gfdepgraph = _gfdepgraph.dot

all: help

help:
	@echo Targets:
	@echo
	@echo "  dg_Action_eog:  displays module hierarchy diagram for the Action-grammar"
	@echo "  dg_Action_png:  saves module hierarchy diagram for the Action-grammar as PNG"
	@echo "  fsg:          converts all PGFs to FSGs"
	@echo "  build_Action: builds PGF of Action grammar"
	@echo "  ..."

fsg:
	../tools/allpgf-to-fsg.bash . build/fsg

dg_Action_dot:
	echo "dg -only=$(modules_Action)" | $(gf_retain) $(foreach lang,$(langs),Action/Action$(lang).gf)

dg_Action_eog: dg_Action_dot
	dot -Tsvg $(gfdepgraph) > Action.svg
	rm $(gfdepgraph)
	eog Action.svg

dg_Action_png: dg_Action_dot
	dot -Tpng $(gfdepgraph) > Action.png
	rm $(gfdepgraph)

show_test_results:
	diff -r -x *.fsm -x *.fsg -x *.sym test_gold/ build/test_out/

build_Action:
	$(gf) $(foreach l,$(langs2),Action/Action$(l).gf)

build_Calc:
	$(gf) $(foreach l,$(langs2),Calc/Calc$(l).gf)

build_Expr:
	$(gf) $(foreach lang,$(langs),Expr/Expr$(lang).gf)

build_ArithExpr:
	$(gf) $(foreach lang,$(langs),ArithExpr/ArithExpr$(lang).gf)

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
	$(gf) $(foreach l,$(langs2),Alarm/Alarm$(l).gf)

build_Tallinndirection:
	$(gf) $(foreach lang,$(langs1),Tallinndirection/Tallinndirection$(lang).gf)

build_Weather:
	$(gf) $(foreach lang,$(langs1),Weather/Weather$(lang).gf)

build_Uri:
	$(gf) $(foreach lang,$(langs),Uri/Uri$(lang).gf)

commit:
	git commit -a -m "f"

clean:
	find -name "*.gfo" | xargs rm -f
	find -name "*.pgf" | xargs rm -f
