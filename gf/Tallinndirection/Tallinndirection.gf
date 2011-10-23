abstract Tallinndirection = Tallinnaddress ** {

flags startcat = Tallinndirection;

cat Tallinndirection;

fun
	direction_id : Tallinnaddress -> Tallinndirection;
	direction : Tallinnaddress -> Tallinnaddress -> Tallinndirection;

}
