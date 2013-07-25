Grammars-project website
========================

Compiling the website
---------------------

	git checkout master

	ant clean

	make-pgf.sh

	make dg_Action_png

	git checkout gh-pages

	# Update automatically generated input examples
	bash copy_gr.bash

	# Update PGF files
	cp gf/*.pgf grammars/pgf/

	# Update documentation
	cp gf/Action.png images/
	vim index.html # update the date and the commit ID
	xmllint index.html

	# Publish
	git commit -a

	git push

	git checkout master

	# update the grammars on the server
