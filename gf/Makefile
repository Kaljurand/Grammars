
path = lib:Numeral:Date:Action:Alarm:Calc:Expr:Fraction:Unitconv:Direction:Address:Eeppl:Tallinnaddress

langs = App Est Eng
langs2 = App Est

gf = gf --make --optimize-pgf --mk-index --path=$(path)

build_all: build_numeral build_date build_alarm

build_numeral:
	$(gf) $(foreach lang,$(langs),Numeral/Numeral$(lang).gf)

build_date:
	$(gf) $(foreach lang,$(langs),Date/Date$(lang).gf)

build_alarm:
	$(gf) $(foreach lang,$(langs),Alarm/Alarm$(lang).gf)

build_action:
	$(gf) $(foreach lang,$(langs2),Action/Action$(lang).gf)
