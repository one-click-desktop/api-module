#! /bin/sh

SOURCE=overseer.yaml
SOURCE_VERSION=$(curl -s https://raw.githubusercontent.com/one-click-desktop/api-module/$BRANCH/$SOURCE | awk '/version:/ {print $2}')
CURRENT_VERSION=$(awk '/version:/ {print $2}' $SOURCE)

echo Source version: $SOURCE_VERSION
echo Current version: $CURRENT_VERSION

if [ "$(printf '%s\n' "$CURRENT_VERSION" "$SOURCE_VERSION" | sort -Vr | head -n1)" = "$SOURCE_VERSION" ]; then
    echo "API version needs to be higher than the one in main"
    exit 1
fi