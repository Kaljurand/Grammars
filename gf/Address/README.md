Address
=======

TALLINNA TÄNAVAD LINNAOSADE KAUPA
3. juuni 2011
Downloaded from: http://www.eki.ee/knab/tallinn3.htm

Some postprocessing (HTML->TXT) was applied to the original list
using `filter.sh`. The output of `filter.sh` can be converted into
GF using `make_street.py`.

This grammar demonstrates a simple language with a reasonably large
vocabulary (~1500 terminals).

Compiling
---------

    gf -s --make --optimize-pgf --mk-index --path "Eeppl:Numerals:lib" Address/Address???.gf

TODO
----

  * refactor the grammar so that other towns (with their streets) could be easily plugged in
