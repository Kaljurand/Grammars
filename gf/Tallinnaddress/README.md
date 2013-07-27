Tallinnaddress
==============

Introduction
------------

This is a simple grammar for Tallinn's addresses, e.g.

  - Keskuse 18
  - Estonia puiestee
  - Kanuti aed

covering all Tallinn's street names (~1500) and
allowing them to be combined with numbers between 1 and 1000.
Also, some other place names are included.

The grammar is simple in the sense that it does not do any geocoding.


Origin
------

Data downloaded from <http://xgis.maaamet.ee/knravalik/knr>
by "Otsi" + "Export CSV",
i.e. all the input search fields have the default values.

Last update: 2013-07-27


Pre-processing
--------------

Extracting street names and other place names.

	cat knr.csv | sh filter.sh | python ../tools/make_fun.py --lang Est Tallinnstreet
	cat knr.csv | sh filter_nonstreet.sh | python ../tools/make_fun.py --lang Est Tallinnplace


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
