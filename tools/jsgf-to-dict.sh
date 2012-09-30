# See: https://github.com/alumae/et-g2p
et_g2p=${HOME}/myapps/et-g2p/

here=$(dirname $(readlink -f $0))

grep -v "^grammar .*;$" |\
python $here/get-jsgf-tokens.py | grep "^STR" | cut -f2 | sort | uniq | $et_g2p/run.sh
