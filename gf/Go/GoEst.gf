concrete GoEst of Go = {

	flags coding=utf8;

	lincat Go, Number, Unit, Direction = {s : Str};

	lin
		go x y z = {s = "mine" ++ x.s ++ y.s ++ z.s};

		back = { s = "tagasi" };
		forward = { s = "edasi" };

		n1 = { s = "üks" };
		n2 = { s = "kaks" };
		n3 = { s = "kolm" };
		n4 = { s = "neli" };
		n5 = { s = "viis" };

		meter = { s = "meetrit" };

}
