Eeppl (Estonian populated places)
=================================

Introduction
------------

This grammar lists names of Estonian populated places, from towns to boroughs to
villages (_linn_, _alev_, _alevik_, _küla_).

The grammar is automatically generated and should _not_ be manually edited.
In order to improve the names edit the source (KNR or GeoNames),
and the changes will propagate into the grammar at some point.

Last update: 2013-07-27 (KNR)

Variants and ambiguity
----------------------

In the real world places have name variants (also within the same language), e.g.
"Tõrma" and "Tõrma küla" would refer to the same place. Other forms of variants include
historical names.
Also, place names
can be ambiguous, e.g. "Tõrma" refers to a village in (at least) two different locations.

At the moment this grammar does not model variation and ambiguity, i.e.
bijection holds between
the set of places (functions) and
the set of place names (linearizations).
Disambiguation must be performed by an external application (e.g. Google Maps).


KNR
---

Data downloaded from <http://xgis.maaamet.ee/knravalik/knr>
by "Otsi" + "Export CSV",
i.e. all the input search fields have the default values.

Converted to GF using [update_from_knr.sh](update_from_knr.sh).

	Warning: Ignoring line 2647: Persåker
	Warning: Ignoring line 3381: Skåtanäs
	Number of place names: 4416


GeoNames
--------

_deprecated: use KNR_

The 4330 names originate from the GeoNames `PPL`-fields (populated places)
and include only the official name (i.e. not any alternative names).

Relevant links:

  * <http://download.geonames.org/export/dump/EE.zip>
  * <http://download.geonames.org/export/dump/>
  * <http://www.geonames.org/export/codes.html>
  * <http://download.geonames.org/export/dump/readme.txt>
  * <http://www.geonames.org/recent-changes/country/EE/>

Converted to GF using [update_from_geonames.sh](update_from_geonames.sh).

One PPL-line was excluded because it contained a name with characters outside of
the Estonian alphabet (a Latvian place name Jaunāmuiža).
About 100 names in the data
mark Estonian umlaut characters with `y` but this was preserved like this. This
should be fixed in the source.

	Warning: Ignoring line 589: Jaunāmuiža
	Number of place names: 4332
