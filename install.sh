#!/bin/bash
# install.sh - Links config files to home directory

# Get the directory where this script is located
DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Create a symlink for .gitconfig (back up existing one first)
if [ -f ~/.gitconfig ] && [ ! -L ~/.gitconfig ]; then
    mv ~/.gitconfig ~/.gitconfig.bak
    echo "Backup created at ~/.gitconfig.bak"
fi

ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig

echo "Dotfiles installed successfully!"
