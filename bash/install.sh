dir=$(dirname "$(readlink -f "$0")")
cd $dir
# Create backup folder if it doesn't exist
[ -e "$dir/bak" ] || mkdir "$dir/bak"
# Include hidden files in results
shopt -s dotglob
for file in .[^.]*; do
    # Sanity check in case no files are found
    [ -e $file ] || continue
    # Previous existing file not found
    [ -e ~/$file ] || echo "File $file not found! Installing."
    # Previous existing file found
    [ ! -e ~/$file ] || (echo "File $file found! Backing up."; \
                         mv ~/$file "$dir/bak")
    # Create a symlink to the file
    ln -s $dir/$file ~
done
echo "Files backed up in ~/.dotfiles/bash/bak/"