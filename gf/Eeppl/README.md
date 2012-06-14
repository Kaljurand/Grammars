Eeppl (Estonian populated places)
=================================

Introduction
------------

This grammar lists 4330 names of Estonian populated places, from towns to boroughs to
villages (_linn_, _alev_, _alevik_, _küla_), and covers ~93% of all the places.
(Wikipedia, <http://et.wikipedia.org/wiki/Eesti>:
2008. aasta 20. juulil oli Eestis 47 linna, 10 alevit, 177 alevikku ja 4437 küla.)

The official list of place names is (probably)
<https://www.riigiteataja.ee/akt/12996646?leiaKehtiv> but because this list is not
easily machine processable, we currently use the GeoNames data.

Origin of this data
-------------------

The names originate from the GeoNames `PPL`-fields (populated places)
and include only the official name (i.e. not any alternative names).
Based on GeoNames EE.zip of 2012-06-14.

Relevant links:

  * <http://download.geonames.org/export/dump/EE.zip>
  * <http://download.geonames.org/export/dump/>
  * <http://www.geonames.org/export/codes.html>
  * <http://download.geonames.org/export/dump/readme.txt>
  * <http://www.geonames.org/recent-changes/country/EE/>

The grammar is automatically generated from the GeoNames file and should _not_
be manually edited. In order to improve the names edit the GeoNames source,
and the changes will propagate into the grammar at some point.

The grammar is updated using the script `update_from_geonames.sh`.


Conversion to GF
----------------

Extracting the list of names of populated places (`PPL`) from `EE.txt`:

	$ cat EE.txt | cut -f2,8 | grep PPL | cut -f1 | sort | uniq | python ../tools/make_fun.py --lang Est Eeppl

	Warning: Ignoring line 586: Jaunāmuiža

One PPL-line was excluded because it contained a name with characters outside of
the Estonian alphabet (a Latvian place name). About 100 names in the data
mark Estonian umlaut characters with `y` but this was preserved like this. This
should be fixed in the source.


Variants and ambiguity
----------------------

In the real world places have name variants (also within the same language), e.g.
"Tõrma" and "Tõrma küla" would refer to the same place. Other forms of variants include
historical names.
Also, place names
can be ambiguous, e.g."Tõrma" refers to a village in (at least) two different locations.

At the moment this grammar does not model variation and ambiguity, i.e.
bijection holds between
the set of places (functions) and
the set of place names (linearizations).
Disambiguation must be performed by an external application (e.g. Google Maps).
