concrete CalcApp of Calc = ExprApp, UnitconvApp ** open StringOper in {

-- CalcApp is a union of ExprApp and UnitconvApp.
--
-- @author Kaarel Kaljurand
-- @version 2011-10-03

lincat Calc = SS;
lin expr, unitconv = id SS;

}
