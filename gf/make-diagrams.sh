grammars_abstract="grammars_abstract"
grammars="grammars"

find . -name "*.gf" | xargs cat | ./make-diagram.py > ${grammars_abstract}.dot
dot -Tpng ${grammars_abstract}.dot > ${grammars_abstract}.png

find . -name "*.gf" | xargs cat | ./make-diagram.py --concrete=True > ${grammars}.dot
dot -Tpng ${grammars}.dot > ${grammars}.png
