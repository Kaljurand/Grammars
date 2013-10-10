This project is about natural language grammars with the focus on

  - [Grammatical Framework (GF)](http://www.grammaticalframework.org/)
  - multilinguality (Estonian, English)
  - speech applications (e.g. voice actions for smart phones)

Dependecies
-----------

The grammars are implemented in GF. In addition to the GF compiler and runtime,
you need

  - [Estonian resource grammar](https://github.com/GF-Estonian/GF-Estonian)
    - set `GF_EST_SRC` to point to its root directory

Various tools are needed for testing etc.:

  - [GF-Utils](https://github.com/Kaljurand/GF-Utils)
  - [CMU Sphinx](http://cmusphinx.sourceforge.net/), sphinxbase
  - [et-g2p](https://github.com/alumae/et-g2p.git)
  - [OpenFst](http://www.openfst.org/)
  - make, bash, sed/grep, Python
