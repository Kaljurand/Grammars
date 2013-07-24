# Declare the name of the grammar and the paths to the used libraries
g="ArithExpr"
path="../Numeral/:../Fraction/:../lib/"

# These you probably do not need to modify
l_est="${g}Est"

examples="examples/"
e_est="${examples}Est.txt"

# These are the actual tests
echo "read_file -file=\"${e_est}\" -lines | p -lang=${l_est} | pt -compute | l -bind" | gf --run --path $path *.gf
