Unit conversion grammar
=======================

Introduction
------------

This grammar demonstrates:

  * importing another grammar (Numerals)
  * support for multiple wordforms of the same word (`meetrit', `meetrites')
  * using opers
  * smart paradigms (i.e. generate PlIn automatically from SgPart)
  * unit type checking (meters and feet agree, but meters and liters do not)

TODO:

  * "large" vocabulary (hundreds of units)
  * lexing and unlexing (writing of numbers) (maybe use binding in the decimal grammar?)
  * exclude repetitions like "12 liters in liters"
  * use dependent types in unit type checking 


How to add a new unit to the grammar
------------------------------------

If the unit's type (e.g. LengthUnit, WeightUnit, ...) is already present in the grammar,
then just edit the file Unit.gf to add the mapping of the new unit (e.g. `meter')
to the existing type:

    fun meter : LengthUnit;

and add the words of the unit to the concrete syntaxes (UnitEst.gf and UnitApp.gf):

    lin meter = mk "meetrit";
    lin meter = ss "m";

If the type is not described in the grammar then additionally add the new category to Unit.gf:

    cat LengthUnit;

and the corresponding conversion function to Unitconv.gf:

    length : LengthUnit -> LengthUnit -> Conv ;

and the implementation of the function (in both UnitconvEst.gf and UnitconvApp.gf)

    lin length = c ;
