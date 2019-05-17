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
    # Previously installed file not found
    [ -e ~/$FILE ] || (echo "Installed file $FILE not found! Skipping."; 
                       continue)
    # Previously installed file found
    [ ! -e ~/$FILE ] || (echo "Installed file $FILE found! Deleting."; \
                         rm ~/$FILE)
    # Backup of installed file exists
    [ ! -e $FULLPATH/bak/$FILE ] || (echo "Installed file $FILE backup found! Restoring."; \
                                mv "$FULLPATH/bak/$FILE" ~)
done