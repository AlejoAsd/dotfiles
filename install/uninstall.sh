dir=$(dirname "$(readlink -f "$0")")
cd $dir
# Create backup folder if it doesn't exist
[ -e "$dir/bak" ] || mkdir "$dir/bak"
# Include hidden files in results
shopt -s dotglob
for file in .[^.]*; do
    # Sanity check in case no files are found
    [ -e $file ] || continue
    # Previously installed file not found
    [ -e ~/$file ] || (echo "Installed file $file not found! Skipping."; continue)
    # Previously installed file found
    [ ! -e ~/$file ] || (echo "Installed file $file found! Deleting."; \
                         rm ~/$file)
    # Backup of installed file exists
    [ ! -e $dir/bak/$file ] || (echo "Installed file $file backup found! Restoring."; \
                                mv "$dir/bak/$file" ~)
done