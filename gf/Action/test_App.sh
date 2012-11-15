
name=$1

# These you probably do not need to modify
l="${name}App"

examples="examples/"
e_f="${examples}App.txt"

# These are the actual tests
cat ${e_f} | sed "s/^/p -lang=${l} \"/" | sed 's/$/" | l -all -bind/' | gf --run ../${name}.pgf
