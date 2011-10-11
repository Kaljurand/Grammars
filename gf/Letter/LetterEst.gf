concrete LetterEst of Letter = open StringOper in {

-- Ff (eff), Šš (šaa), Zz (zett, hääldus: [sett]) ja Žž (žee, hääldus: [šee])
-- esinevad ainult võõrsõnades ja võõrnimedes.
-- Tähtede z ja ž eestipärane hääldus on vastavalt nõrk [s] ja [š].

flags coding = utf8;

lincat Letter = Str;

lin
la = "alfa" | "aa";
lb = "berta" | "bee";
lc = "tseesar" | "tsee";
ld = "dee";
le = "ee";
lf = "eff";
lg = "gee";
lh = "ha" | "has~s~";
li = "ii";
lj = "jott";
lk = "kaa";
ll = "ell";
lm = "emm";
ln = "enn";
lo = "oo";
lp = "pee";
lq = "kuu";
lr = "err";
ls = "ess";
lscaron = "s~aa";
lz = "zett" | "sett";
lzcaron = "z~ee" | "s~ee";
lt = "tee";
lu = "uu";
lv = "vee";
lw = "kaksisvee" | "kaksikvee";
lotilde = "õõ";
lauml = "üü";
louml = "öö";
luuml = "ää";
lx = "iks";
ly = "igrek" | "üpsilon";

}
