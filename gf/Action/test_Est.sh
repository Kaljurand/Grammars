name=$1
sedscript="../../tools/make_gf_parse_lin_command_Est.sed"
examples="examples/"
e_f="${examples}Est.txt"

cat ${e_f} | sed -f ${sedscript} | gf --run ../${name}.pgf
