Copy
====

_Copy_ is the copy language which is not context-free
and cannot be expressed in BNF (e.g. JSGF).

	Copy> p -lang=C1 "a b b a a b AND a b b a a b" | l -treebank
	Copy: copy (a (b (b (a (a (b nil))))))
	CopyC1: a b b a a b AND a b b a a b
	CopyC2: b a a b b a AND b a a b b a

_CopyC1_ and _CopyC2_ describe the same language, but their
corresponding JSGF files do not:

  * `CopyC1.jsgf` overgenerates, and
  * for `CopyC2.jsgf` the translator finishes with an error.

Building JSGF (and other speech recognition grammars):

	$ sh make-pgf.bash
	...
	Writing CopyC1.jsgf...
	Writing CopyC2.jsgf...gf: mergeIdentical: AB_1
	...

(Maybe there is a problem with the PGF->BNF translator?)
