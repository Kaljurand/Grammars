
dir_source=gf/build/gr/
dir_target=grammars/gr/

for dir in $(ls $dir_source); do
	echo $dir
	cp ${dir_source}/$dir/lin_App.txt $dir_target/${dir}.txt
done
