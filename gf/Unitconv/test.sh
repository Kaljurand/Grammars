# Declare the name of the grammar and the paths to the used libraries
g="Unitconv"
path=$1

sedscript="../../tools/make_gf_parse_lin_command.sed"
sedscript_Est="../../tools/make_gf_parse_lin_command_Est.sed"

# These you probably do not need to modify
l_est="${g}Est"
l_app="${g}App"

examples="examples/"
e_est="${examples}Est.txt"
e_app="${examples}App.txt"

echo "Parsing ${e_est}"
echo "-------"

# This commandline does not stop in case of errors.
cat ${e_est} | sed -f ${sedscript_Est} | gf --run --path $path ${g}???.gf

echo "Parsing ${e_app}"
echo "-------"

# This commandline does not stop in case of errors.
cat ${e_app} | sed -f ${sedscript} | gf --run --path $path ${g}???.gf
