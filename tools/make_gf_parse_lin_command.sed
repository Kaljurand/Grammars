# Injects the input string into a "parse | linearize" command
# of the GF commandline tool.
#
# Example:
#
# $ echo "hello world" | sed -f make_gf_parse_lin_command.sed
# p -lang=App "hello world" | l | ps -bind
#
# TODO: add escaping
#
s/^/p -lang=App \"/
s/$/\" | l | ps -bind/
