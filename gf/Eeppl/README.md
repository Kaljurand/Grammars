Eeppl (Estonian populated places)
=================================

Introduction
------------

4333 names of Estonian populated places.
Based on GeoNames EE.zip of 04-Apr-2012 01:59.


Origin of this data
-------------------

The names originate from the GeoNames `PPL`-field (populated places)
and include only the official name and not any alternative names.

Relevant links:

  * http://download.geonames.org/export/dump/EE.zip
  * http://download.geonames.org/export/dump/
  * http://www.geonames.org/export/codes.html
  * http://download.geonames.org/export/dump/readme.txt

The grammar is automatically generated from the GeoNames file and should not
be manually edited. In order to improve the names edit the GeoNames source,
and the changes will propagate into the grammar at some point.


Conversion to GF
----------------

Extracting the list of names of populated places (`PPL`) from `EE.txt`:

> cat EE.txt | cut -f2,8 | grep PPL | cut -f1 | sort | uniq | python ../tools/make_fun.py --lang Est Eeppl

	Warning: Ignoring line 586: Jaunāmuiža

One PPL-line was excluded because it contained a name with characters outside of
the Estonian alphabet (a Latvian place name). About 100 names in the data
mark Estonian umlaut characters with `y` but this was preserved like this. This
should be fixed in the source.


Variants and ambiguity
----------------------

In the real world places have name variants (also within the same language), e.g.
"Tõrma" and "Tõrma küla" would refer to the same place. Also, place names
can be ambiguous, e.g."Tõrma" refers to a village in (at least) two different locations.

At the moment this grammar does not model variation and ambiguity, i.e.
bijection holds between
the set of places (functions) and
the set of place names (linearizations).
Disambiguation must be performed by an external application (e.g. Google Maps).
