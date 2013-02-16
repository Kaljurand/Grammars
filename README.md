Grammars-project website
========================

Compiling the website
---------------------

	git checkout master

	ant clean

	make-pgf.sh

	make dg_Action

	git checkout gh-pages

	cp gf/build/gr/* grammars/gr/

	cp gf/*.pgf grammars/pgf/

	cp gf/Action.png images/

	vim index.html # update the date and the commit ID

	git commit -a

	git push

	git checkout master

	# update the grammars on the server
