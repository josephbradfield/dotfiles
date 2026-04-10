#!/bin/bash
# install.sh - Links config files to home directory

# Get the directory where this script is located
DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)


# List of files to link (space-separated)
FILES=".gitconfig .screenrc .bash_aliases .bashrc"

for FILE in $FILES; do
    # Back up existing files if they aren't already links
    if [ -f ~/"$FILE" ] && [ ! -L ~/"$FILE" ]; then
        mv ~/"$FILE" ~/"$FILE.bak"
        echo "Backed up $FILE to $FILE.bak"
    fi
    
    # Create the symlink
    ln -sf "$DOTFILES_DIR/$FILE" ~/"$FILE"
    echo "Linked $FILE"
done

echo "Done! Restart your shell or run 'source ~/.bashrc' to apply changes."
