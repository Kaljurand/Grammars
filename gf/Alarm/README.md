Alarm
=====

Introduction
------------

There are two types of expressions that this grammar supports:

  - time of day (when the alarm should ring), e.g. `alarm 8 : 01`
  - time period (after which the alarm should ring), e.g. `alarm in 3 hours and 120 minutes`

The corresponding Estonian expressions are:

  - ärata mind kell kaheksa null üks
  - ärata mind kolm tundi ja sada kaks kümmend minutit hiljem

The latter would sound much better as

  - ärata mind kolme tunni ja saja kahe kümne minuti pärast

but this requires genitive case endings, which we cannot yet generate for
numerals.
