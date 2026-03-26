#!/bin/bash
#
# Removes symlinks created by install.sh and restores backups.
#
# Reads .install.conf if present (same format as install.sh).

SOURCE="$(cd "$(dirname "$0")" && pwd)"
TARGET="$HOME"
PATTERN='.*'

if [ -f "$SOURCE/.install.conf" ]; then
    source "$SOURCE/.install.conf"
    TARGET="${TARGET/#\~/$HOME}"
fi

cd "$SOURCE" || exit 1

SKIP_FILES="install.sh uninstall.sh README.md .install.conf"

shopt -s nullglob
for FILE in $PATTERN; do
    [ -f "$FILE" ] || continue
    skip=false
    for S in $SKIP_FILES; do
        [ "$FILE" = "$S" ] && skip=true
    done
    $skip && continue

    if [ ! -e "$TARGET/$FILE" ]; then
        echo "Installed file $FILE not found! Skipping."
        continue
    fi

    echo "Installed file $FILE found! Deleting."
    rm "$TARGET/$FILE"

    if [ -e "$SOURCE/bak/$FILE" ]; then
        echo "Backup of $FILE found! Restoring."
        mv "$SOURCE/bak/$FILE" "$TARGET/"
    fi
done
