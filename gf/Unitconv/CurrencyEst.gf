concrete CurrencyEst of Currency = open StringOper, Estonian in {

-- @author Kaarel Kaljurand
-- @version 2013-10-10

flags coding=utf8;

oper

	mk_major_currency : CaseStr = mkForms "suurt valuutat" "NA" "suures valuutas" ;

	mk_raha : Str -> CaseStr = \x ->
		prefix x (mkForms "raha" "rahas" "rahas") ;

	mk_currency_variants_4 : Str -> CaseStr -> CaseStr = \x,unit ->
		variants {
			unit ;
			prefix x unit;
			mk_raha x;
			mk_major_currency
		};

	-- Generates 3 variants, from two input strings, e.g.:
	-- Input: "ameerika", "dollarit"
	-- Output variants:
	--   * dollarit/dollarites
	--   * ameerika dollarit / ameerika dollarites
	--   * ameerika raha / ameerika rahas
	mk_currency_variants_3 : Str -> CaseStr -> CaseStr = \x,y ->
		variants { y ; prefix x y; mk_raha x };

	mk_currency_variants_2 : Str -> Str -> CaseStr = \x,y ->
		variants { prefix x (mkUnit y); mk_raha x };


lincat CurrencyUnit = CaseStr;

lin

-- TODO: get the country names from the Country-module
usd = mk_currency_variants_4 "ameerika" (mkUnit "dollar") ;
gbp = mk_currency_variants_4 "inglise" (mkUnit "nael" "naela") ;
jpy = mk_currency_variants_4 "jaapani" (mkUnit "jeen") ;
rub = mk_currency_variants_3 "vene" (mkUnit "rubla" "rubla" "rubla");
-- TODO: inflects like 'audit' ?
huf = mk_currency_variants_3 "ungari" (mkUnit "forint" "forinti" "forintit") ;

cad = mk_currency_variants_2 "kanada" "dollar";
nzd = mk_currency_variants_2 "uus mere maa" "dollar";
aud = mk_currency_variants_2 "austraalia" "dollar";
nok = mk_currency_variants_2 "norra" "kroon";
sek = mk_currency_variants_2 "rootsi" "kroon";
dkk = mk_currency_variants_2 "taani" "kroon";
isk = mk_currency_variants_2 "islandi" "kroon";

eur = mkUnit "euro" | mk_major_currency;

chf = mk_currency_variants_4 "šveitsi" (mkUnit "frank") ;

eek = variants {
		mkUnit "kroon" ;
		prefix "eesti" (mkUnit "kroon") ;
		mk_raha "eesti" ;
		mkForms "vana raha" "NA" "vanas rahas"
	};
}
