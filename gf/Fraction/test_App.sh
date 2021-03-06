# Declare the name of the grammar and the paths to the used libraries
name=$1
path=$2

l="${name}App"

l_f="${l}.gf"

examples="examples/"
e_f="${examples}App.txt"

# These are the actual tests
cat ${e_f} | sed "s/^/p -tr -lang=${l} \"/" | sed 's/$/" | l -all -bind/' | gf --run --path $path ${l_f}
