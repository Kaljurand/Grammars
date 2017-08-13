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

Extracting street names and other place names
---------------------------------------------

First update the data in ../../data/knr/.

    ./make-city.sh ../../data/knr/knr_20170813.csv Tallinn
    ./make-city.sh ../../data/knr/knr_20170813.csv Tartu
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
