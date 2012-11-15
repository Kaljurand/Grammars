Action
======

This grammar is meant to be the union of all other grammars that make
sense in the context of "voice actions".
Not all grammars support all languages, e.g. `Direction` does not support `Eng`.
The current components are:

  - Alarm (Est, Eng)
  - Calc (Est, Eng)
  - Dial (Est)
  - Direction (Est)

TODO: support DialEng (currently there is a conflict caused by DigitEng)

TODO: generate this grammar automatically based on a small
configuration file that just lists the desired abstract modules and
their corresponding concrete modules.
