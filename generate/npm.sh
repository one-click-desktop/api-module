#! /bin/sh

SOURCE=overseer.yaml
OUTPUT=npm
OPTIONS=options/npm.json

rm -rf $OUTPUT

openapi-generator-cli generate \
 -i $SOURCE \
 -g typescript-angular \
 -o $OUTPUT \
 -c $OPTIONS \

if [ "$(ls -A patches/npm)" ]
then
	for i in patches/npm/* ; do
	   patch -p1 -d $OUTPUT < $i
	done
fi