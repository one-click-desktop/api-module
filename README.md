# api-module

API module for OneClickDesktop frontend application

## Generate

Run `generate.bat` or `generate.sh` to generate Angular API module based on `overseer.yaml` definition.

Because of errors with generation files `package.json` and `index.ts` are excluded from changes.
If you need to regenerate them you can remove the entry from `.swagger-codegen-ignore` and restore it after generation. You may need to manually reapply the fixes.
