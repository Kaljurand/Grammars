server=http://cloud.grammaticalframework.org
cloud=$server/cloud

if [ $# -ne 2 ]
then
	echo "Usage: sh upload-pgf-to-gf-cloud.sh <id> <grammars-dir>"
	exit
fi

dir=/tmp/$1
grammars=$2

for g in $(ls ${grammars}/*.pgf); do
	name=`basename $g`
	echo "Uploading $name ($g)"
	curl -d dir=$dir -d command=upload --data-urlencode ${name}@${g} $cloud
done

# List files
echo
echo "Listing: ${dir}"
curl -d dir=$dir -d command=ls -d ext=.pgf $cloud
echo
