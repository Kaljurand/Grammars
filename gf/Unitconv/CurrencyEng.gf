concrete CurrencyEng of Currency = open StringOper in {

-- @author Kaarel Kaljurand
-- @version 2012-12-17

flags coding=utf8;

oper

	mkCurrencyName : Str -> Str -> SS = \x,y ->
		variants { ss (x ++ y) ; ss y };

lincat CurrencyUnit = SS;

lin

usd = mkCurrencyName ("American" | "U S") "dollars";
gbp = mkCurrencyName "British" "pounds";
jpy = mkCurrencyName "Japanese" "yens";
rub = mkCurrencyName "Russian" "roubles";
huf = mkCurrencyName "Hungarian" "forints";
cad = ss "Canadian dollars";
nzd = ss "New Zealand dollars";
aud = ss "Australian dollars";
nok = ss "Norwegian crowns";
sek = ss "Swedish crowns";
dkk = ss "Danish crowns";
isk = ss "Icelandic crowns";
eur = ss "Euros";
chf = mkCurrencyName "Swiss" "francs";
eek = ss "Estonian crowns";
}
