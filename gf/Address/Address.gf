abstract Address = Town, StreetF, Numerals ** {

flags startcat = Address;

cat Address;

fun
	-- We redefine `num` to exclude numbers larger than 999
	-- because these don't occur as part of Estonian street addresses.

	address1 : Street -> Town -> Address;
	address2 : Street -> Numeral -> Town -> Address;

}
