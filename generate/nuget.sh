#! /bin/sh

SOURCE=overseer.yaml
OUTPUT=nuget
OPTIONS=options/nuget.json
VERSION=`awk '/version:/ {print $2}' $SOURCE`

rm -rf $OUTPUT

openapi-generator-cli generate \
 -i $SOURCE \
 -g aspnetcore \
 -o $OUTPUT \
 -c $OPTIONS \
 -p packageVersion=$VERSION

if [ "$(ls -A patches/nuget)" ]
then
	for i in patches/nuget/* ; do
		echo $i
	   patch -p1 -d $OUTPUT < $i
	done
fi
