#! /bin/sh

SOURCE=overseer.yaml
OUTPUT=npm
OPTIONS=options/npm.json

java -jar swagger-codegen-cli.jar generate \
 -i $SOURCE \
 -l typescript-angular \
 -c $OPTIONS \
 --additional-properties npmVersion=`awk '/version:/ {print $2}' $SOURCE` \
 -o $OUTPUT

if [ "$(ls -A patches/npm)" ]
then
	for i in patches/npm/* ; do
	   patch -d $OUTPUT < $i
	done 
fi