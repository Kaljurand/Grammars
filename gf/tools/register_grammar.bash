#!/bin/bash

# Usage example:
#
# ./register-grammar.bash urls.cfg
#
# TODO: support multiple languages
#

if [ $# -ne 2 ]
then
	echo "Usage: register-grammar.bash <cfg-file> <name>"
	exit
fi

if [ ! -r $1 ]; then
	echo "Configuration file not readable: $1" >&2
	exit
fi

# Define $server, $grammars, $lang
source $1

name=$2

pgf="${grammars}${name}.pgf"

echo "Uploading the grammar: ${pgf}"
echo "to the server: ${server}"
echo "using: ${server}/fetch-pgf?url=${pgf}&lang=${lang}"
echo "Do not interrupt this process!!!"

date
echo

curl "${server}/fetch-pgf?url=${pgf}&lang=${lang}"

echo
date
