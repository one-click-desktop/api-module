#! /bin/sh

SOURCE=overseer.yaml

java -jar swagger-codegen-cli.jar generate \
 -i $SOURCE \
 -l typescript-angular \
 -c options.json \
 --additional-properties npmVersion=`awk '/version:/ {print $2}' $SOURCE`