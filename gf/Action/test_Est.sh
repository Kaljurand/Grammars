
name=$1

# These you probably do not need to modify
l="${name}Est"

examples="examples/"
e_f="${examples}Est.txt"

# These are the actual tests
cat ${e_f} | sed "s/^/p -tr -lang=${l} \"/" | sed 's/$/" | l -all/' | gf --run ../${name}.pgf
