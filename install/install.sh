#!/bin/bash
DIR="$(basename $(readlink -f ${0%/*}))"
FULLPATH="$(readlink -f $(dirname "$0"))"
cd $FULLPATH
# Create backup folder if it doesn't exist
[ -e "$FULLPATH/bak" ] || mkdir "$FULLPATH/bak"
# Include hidden files in results
shopt -s dotglob
# Get all files starting with . in FULLPATH
for FILE in .[^.]*; do
    # Sanity check in case no files are found
    [ -e $FILE ] || continue
    # Previous existing file not found
    [ -e ~/$FILE ] || echo "File $FILE not found! Installing."
    # Previous existing file found
    [ ! -e ~/$FILE ] || (echo "File $FILE found! Backing up."; \
                         mv ~/$FILE "$FULLPATH/bak")
    # Create a symlink to the file
    ln -s $FULLPATH/$FILE ~
done
echo -e "Files backed up in \\033[32m$FULLPATH/bak/\\033[0m."