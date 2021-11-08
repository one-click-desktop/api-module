#! /bin/bh
java -jar swagger-codegen-cli.jar generate \
 -i overseer.yaml \
 -l typescript-angular \
 -c options.json