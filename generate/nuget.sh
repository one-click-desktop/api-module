#! /bin/sh

SOURCE=overseer.yaml
OUTPUT=nuget
OPTIONS=options/nuget.json

java -jar swagger-codegen-cli.jar generate \
 -i overseer.yaml \
 -l csharp \
 --api-package OneClickDesktop.Api.Resources \
 --model-package OneClickDesktop.Models.Resources \
 -DmodelTests=false \
 -DapiTests=false \
 -DpackageName='OneClickDesktop.OdsApi.Sdk' \
 -o nuget

if [ "$(ls -A patches/nuget)" ]
then
	for i in patches/nuget/* ; do
	   patch -d $OUTPUT < $i
	done 
fi