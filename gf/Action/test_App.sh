name=$1

sedscript="../../tools/make_gf_parse_lin_command.sed"

# These you probably do not need to modify
examples="examples/"
e_f="${examples}App.txt"

# These are the actual tests
cat ${e_f} | sed -f ${sedscript} | gf --run ../${name}.pgf
