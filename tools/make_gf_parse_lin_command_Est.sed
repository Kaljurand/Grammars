# Injects the input string into a "parse | linearize" command
# of the GF commandline tool.
#
# TODO: add escaping
#
s/^/p -lang=Est \"/
s/$/\" | l | ps -bind/
