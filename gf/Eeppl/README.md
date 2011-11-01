Eeppl (Estonian populated places)
=================================

Introduction
------------

4335 names of Estonian populated places.


Origin of this data
-------------------

The place names were downloaded on 2011-10-16 from GeoNames.

Relevant links:

  * http://download.geonames.org/export/dump/EE.zip
  * http://download.geonames.org/export/dump/
  * http://www.geonames.org/export/codes.html
  * http://download.geonames.org/export/dump/readme.txt


Conversion to GF
----------------

Extracting the list of names of populated places (`PPL`) from `EE.txt`:

    cat EE.txt | cut -f2,8 | grep PPL | cut -f1 | sort | uniq | python ../tools/make_fun.py --lang Est Eeppl
    Warning: Ignoring line 586: Jaunāmuiža

One PPL-line was excluded because it contained a name with characters outside of
Estonian alphabet (a Latvian placename). About 100 names in the data
mark Estonian umlaut characters with `y` but this was preserved like this.
