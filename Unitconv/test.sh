# Declare the name of the grammar and the paths to the used libraries
g="Unitconv"
path="../Numerals/:../lib/"

# These you probably do not need to modify
l_est="${g}Est"
l_app="${g}App"

g_est="${l_est}.gf"
g_app="${l_app}.gf"

examples="examples/"
e_est="${examples}Est.txt"
e_app="${examples}App.txt"


# These are the actual tests
#echo "read_file -file=\"${e_est}\" -lines | p -lang=${l_est} | l" | gf --run --path $path ${g_est} ${g_app}

# This commandline does not stop in case of errors.
cat ${e_est} | sed "s/^/p -lang=${l_est} \"/" | sed 's/$/" | l/' | gf --run --path $path ${g_est} ${g_app}

echo "read_file -file=\"${e_app}\" -lines | p -lang=${l_app} | l" | gf --run --path $path ${g_est} ${g_app}
