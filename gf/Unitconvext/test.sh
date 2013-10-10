# Declare the name of the grammar and the paths to the used libraries
g="Unitconvext"
path=$1

examples="examples/"
e_est="${examples}Est.txt"

echo "Parsing ${e_est}"
echo "-------"

cat ${e_est} | sed "s/^/p -lang=Est \"/" | sed 's/$/" | l -all | ps -bind/' | gf --run --path $path ${g}???.gf
