#! /bin/sh

SOURCE=overseer.yaml
OUTPUT=nuget
VERSION=`awk '/version:/ {print $2}' $SOURCE`

if [ -f nuget ]
then
	rm -rf nuget
fi

java -jar swagger-codegen-cli.jar generate \
 -i $SOURCE \
 -l csharp \
 --api-package "Resources" \
 --model-package "Models" \
 --additional-properties packageVersion=$VERSION,packageName=OneClickDesktop.Api,netCoreProjectFile=true \
 -o $OUTPUT

if [ "$(ls -A patches/nuget)" ]
then
	for i in patches/nuget/* ; do
	   patch -d $OUTPUT < $i
	done 
fi