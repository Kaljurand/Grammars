GF-based speech grammars
========================

Introduction
------------

This document describes how to use GF grammars in speech-enabled applications.

The main idea is that every grammar comes with 3 types of concrete syntaxes
which describe the

  - input, human-spoken (voice action)
  - output, machine-spoken (confirmation)
  - output, machine-executable (evaluation)


Naming conventions
------------------

  - Alarm: abstract
  - AlarmApp: concrete for the machine language (App)
  - AlarmIEst: incomplete concrete for Est and Esttts
  - AlarmLexEst: interface for Est lexicon, shared by Est and Esttts
  - AlarmLexEst1: instance for Est
  - AlarmLexEst2: instance for Esttts
  - AlarmEst: concrete for input language (human-spoken)
  - AlarmEsttts: concrete for output language (machine-spoken)


Compile time
------------

__TODO: update this and the following sections__

The grammar author creates

  * one abstract syntax
  * at least one concrete syntax that corresponds to the spoken input (possibly more that one, because in general the input can be in different languages or dialects)
  * zero or more concrete syntaxes that correspond to the desired service output (possibly zero, in case the user wants to have the "raw" recognizer output returned)

For example:

  * Go.gf: abstract syntax
  * GoEst.gf: concrete Estonian syntax (spoken input)
  * GoApp.gf: concrete syntax, machine code for machine App (desired output)

The grammar author compiles these files into a single PGF-file (Go.pgf)

    gf -make --optimize-pgf GoEst.gf GoApp.gf

publishes it on some URL, e.g.

    git commit Go.pgf; git push ...
    cp Go.pgf ~/Dropbox/Public/...

notifies the server that the grammar on this URL has been updated

    curl http://.../fetch-grammar?lm=http://.../Go.pgf

and studies the server output in order to be notified of possible problems.


The speech recognition server downloads the grammar file

    curl http://.../Go.pgf > Go.pgf

and extracts from it the spoken input syntax(es) in the JSGF-format

    gf -make --output-format=jsgf Go.pgf

(TODO: the above commandline converts all the concrete syntaxes into JSGF, how
to specify that only some have to be converted.)



Run time
--------

The user sends a query to the server giving as input:

  * the audio data
  * the URL of the PGF-grammar
  * the identifier of the language used in the audio (e.g. "Est")
  * zero or more identifiers of the desired output language (e.g. "App")

The server recognizes the audio using GoEst.jsgf, resulting in a string.
This string is returned as is to the user if he/she has specified no "desired" output syntaxes.
Otherwise the string is parsed using the same syntax as used for the speech-to-text and
then linearized into all the desired syntaxes.

For example

	echo "parse -lang=GoEst \"${recognizer_output}\" | linearize -lang=GoApp -bind" | gf --run Go.pgf

The (simple plain text) linearization is then returned to the client.
In case more outputs are desired then some container format must be used.

Note also, that parsing can result in more than one parse tree.
This is the case when the input is ambiguous, e.g. "2 - 3 - 4" with respect
to a simple calculator grammar:

	minus : Expr -> Expr -> Expr;
	number : Number -> Expr;

in case the concrete syntax (which describes the "-" sign) does not specify the associativity.
As a result of multiple parse trees also multiple linearizations are produced
which are not necessarily different. The server would then need to post-process the
linearizations to preserve only the first, or to preserve only the different ones and
return them in a container format.
Another example of ambiguity is the phrase "5 minutes in seconds" where `minutes` and `seconds`
can either refer to time or angles. This ambiguity might not reveal itself in natural
language concrete syntaxes, but would in a mathematical syntax (`sec` vs `"`).
Also, the ambiguity might not reveal itself in the ``final answer'' (1 min in sec = 60).


Grammars
--------

A little comparison of some of the grammars included in this directory.

### Unitconv

Linguistically and structurally most complicated.

  * different morphological forms
  * variants
  * type agreement
  * ...

### Expr

Very small in terms of vocabulary and the type of structures allowed,
but computationally most complicated (contains recursion).

### Address

Very large in terms of terminals (~1500 strings), otherwise very simple.


Guidelines for grammar developers
---------------------------------

### Two types of concrete syntaxes

The PGF packs two types of concrete syntaxes.

#### Parsing grammars (e.g. Est, Eng)

  * input to parser
  * correspond to natural language speech
    * tokens have a clear mapping to phonemes
    * use words (`two`), not symbols (`2`)
    * do not use `glue`
  * possibly allow ambiguous input (i.e. produce multiple parse trees)
    * e.g. `minute` is ambiguous between time and angle
  * possibly allow variants (synonyms)

#### Linearization grammars (e.g. Wolframalpha)

  * output of linearizer
    * `glue` is OK because we use `linearize -bind`
  * typically correspond to a machine language
    * symbols are OK
  * unambiguous (i.e. single tree per sentence)
  * typically we do not care about variants (no `linearize -all`)

### Naming conventions

...


### How to form a union-grammar?

...


### Working with many strings

To convert a large number of strings (e.g. place names) into GF functions and their linearizations
use the script `tools/make_fun.py`.

### Compiling to a speech recognition grammar

Note that GF is a more expressive formalism than a typical speech recognition
grammar formalism such as JSGF (see e.g. the Copy-language example).
This means that translation to JSGF might fail or produce a grammar that overgenerates.
It is therefore important to independently test the JSGF to see if it describes the same language
as the original GF grammar.

### Avoid similarly sounding words in the same syntactic positions

E.g. EstvrpEst and the address-grammars violate this rule

TODO: need tools to help with that

### Avoid short words

because these are difficult to recognize.
