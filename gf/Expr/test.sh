# Declare the name of the grammar and the paths to the used libraries
g="Expr"
path="../Numeral/:../Fraction/:../lib/"

# These you probably do not need to modify
l_est="${g}Est"
l_estamb="${g}Estamb"
l_app="${g}App"

g_est="${l_est}.gf"
g_estamb="${l_estamb}.gf"
g_app="${l_app}.gf"

examples="examples/"
e_est="${examples}Est.txt"


# These are the actual tests
echo "read_file -file=\"${e_est}\" -lines | p -lang=${l_estamb} | l -bind" | gf --run --path $path ${g_estamb} ${g_app}
echo "read_file -file=\"${e_est}\" -lines | p -lang=${l_est} | l -bind" | gf --run --path $path ${g_est} ${g_app}
