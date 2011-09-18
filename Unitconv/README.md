Unit conversion grammar
=======================

This grammar demonstrates:

  * importing another grammar (Numerals)
  * support for multiple wordforms of the same word (`meetrit', `meetrites')
  * using opers
  * smart paradigms (i.e. generate PlIn automatically from SgPart)

TODO:

  * type checking (meters and feet agree, but meters and liters do not)
  * "large" vocabulary (hundreds of units)
  * lexing and unlexing (writing of numbers) (maybe use binding in the decimal grammar?)
  * exclude repetitions like "12 liters in liters"
