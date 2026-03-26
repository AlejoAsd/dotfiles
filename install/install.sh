#!/bin/bash
#
# Symlinks files from the calling directory to a target location.
#
# Defaults: symlinks dotfiles (.*) to ~/
# Override by placing a .install.conf in the calling directory with:
#   TARGET=~/.local/bin
#   PATTERN=*

SOURCE="$(cd "$(dirname "$0")" && pwd)"
TARGET="$HOME"
PATTERN='.*'

# Load overrides if present.
if [ -f "$SOURCE/.install.conf" ]; then
    source "$SOURCE/.install.conf"
    # Expand tilde in TARGET.
    TARGET="${TARGET/#\~/$HOME}"
fi

cd "$SOURCE" || exit 1

mkdir -p "$SOURCE/bak" "$TARGET"

SKIP_FILES="install.sh uninstall.sh README.md .install.conf"

shopt -s nullglob
for FILE in $PATTERN; do
    [ -f "$FILE" ] || continue
    skip=false
    for S in $SKIP_FILES; do
        [ "$FILE" = "$S" ] && skip=true
    done
    $skip && continue

    if [ -e "$TARGET/$FILE" ]; then
        echo "File $FILE found! Backing up."
        mv "$TARGET/$FILE" "$SOURCE/bak/"
    else
        echo "File $FILE not found! Installing."
    fi

    ln -s "$SOURCE/$FILE" "$TARGET/$FILE"
done

echo -e "Files installed to \\033[32m$TARGET/\\033[0m."
