Addresses in Estonian towns
===========================

Introduction
------------

This is a simple grammar for addresses in Estonian towns, e.g.

  - Keskuse 18
  - Estonia puiestee
  - Kanuti aed

currently covering all Tallinn's street names (~1500) and
Tartu street names (~470), and
allowing them to be combined with numbers between 1 and 1000.
Also, some other place names (e.g. names of parks) are included.

The grammar is simple in the sense that it does not do any geocoding.


Origin
------

Data downloaded from <http://xgis.maaamet.ee/knravalik/knr>
by "Otsi" + "Export CSV",
i.e. all the input search fields have the default values.

Last update: 2013-07-27


Extracting street names and other place names
---------------------------------------------

	sh make-city.sh knr.csv Tallinn
	sh make-city.sh knr.csv Tartu
	...


TODO
----

  - few names have not been included:
    - 1. liin (etc.)
    - A. H. Tammsaare tee
    - 20. Augusti väljak
  - more variants could be added:
    - explicit "tänav"
    - drop first name: "Sütiste tee" vs "Juhan Sütiste tee"
  - do not allow impossible house numbers:
    - Lossi plats 987
