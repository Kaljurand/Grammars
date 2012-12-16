Action
======

This grammar is meant to be the union of all other grammars that make
sense in the context of "voice actions".
Not all grammars support all languages, e.g. `Direction` does not support `Eng`.
The current components are:

  - Alarm (Est, Eng)
  - Calc (Est, Eng)
  - Dial (Est, Eng)
  - Direction (Est)

TODO: generate this grammar automatically based on a small
configuration file that just lists the desired abstract modules and
their corresponding concrete modules.
