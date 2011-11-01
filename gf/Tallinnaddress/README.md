Tallinnaddress
==============

Introduction
------------

This is a grammar for Tallinn's addresses, e.g.

  * Keskuse 18
  * Kanuti aed
  * Estonia puiestee

covering all Tallinn's street names and allowing them to be combined with numbers
between 1 and 1000. As such this grammar demonstrates a simple language with
a reasonably large vocabulary (~1500 terminals).


Origin
------

Eesti Keele Instituudi kohanimeandmed (http://www.eki.ee/knab/)

  * TALLINNA TÄNAVAD LINNAOSADE KAUPA
  * 3. juuni 2011
  * Downloaded from: http://www.eki.ee/knab/tallinn3.htm


Pre-processing
--------------

    cat tallinn3.htm | sh filter.sh | python ../tools/make_fun.py --lang Est Tallinnstreet


Compiling
---------

    gf -s --make --optimize-pgf --mk-index --path "Numeral:lib" Tallinnaddress/Tallinnaddress???.gf

TODO
----

  * A few street names have not been included:
    * 1. liin (etc.)
    * A. H. Tammsaare tee
    * Maneeži
    * Nikolai v. Glehni
    * Nikolai v. Glehni põik

  * Some street names were included but not in the spoken form:
    * Patriarh Aleksius II väljak
    * ...

  * Some variants could be added:
    * explicit "tänav"
    * drop first name: "Sütiste tee" vs "Juhan Sütiste tee"

  * Add list of place names that are not street names:
    * Tammsaare park
    * ...

  * Do not allow impossible house numbers:
    * Lossi plats 987
