concrete CalcEst of Calc = ExprEst, UnitconvEst ** open StringOper in {

-- CalcEst is a union of ExprEst and UnitconvEst.
--
-- @author Kaarel Kaljurand
-- @version 2011-12-11

lincat Calc = SS;
lin expr, unitconv = prefixSS (optStr "kui palju on");
}
