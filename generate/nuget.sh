#! /bin/sh

SOURCE=overseer.yaml
OUTPUT=nuget
OPTIONS=options/nuget.json
VERSION=`awk '/version:/ {print $2}' $SOURCE`

rm -rf nuget

openapi-generator-cli generate \
 -i overseer.yaml \
 -g aspnetcore \
 -o $OUTPUT \
 -c $OPTIONS \
 -p packageVersion=$VERSION

if [ "$(ls -A patches/nuget)" ]
then
	for i in patches/nuget/* ; do
	   patch -d $OUTPUT < $i
	done 
fi