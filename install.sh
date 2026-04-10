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

# Configure Git user name and email
if [ -x "$(command -v git)" ]; then
    echo "Configuring Git..."
    
    # Check if user.name is already set and not the placeholder
    CURRENT_GIT_NAME=$(git config --global --get user.name)
    if [ -z "$CURRENT_GIT_NAME" ] || [ "$CURRENT_GIT_NAME" = "=" ]; then
        DEFAULT_GIT_NAME="Joseph Bradfield"
        read -p "Enter your Git user name (Default: ${DEFAULT_GIT_NAME}): " git_user_name_input
        git_user_name=${git_user_name_input:-$DEFAULT_GIT_NAME}
        git config --global user.name "$git_user_name"
    else
        echo "Git user.name is already set to: $CURRENT_GIT_NAME"
    fi
    
    # Check if user.email is already set and not the placeholder
    CURRENT_GIT_EMAIL=$(git config --global --get user.email)
    if [ -z "$CURRENT_GIT_EMAIL" ] || [ "$CURRENT_GIT_EMAIL" = "=" ]; then
        DEFAULT_GIT_EMAIL="josephbr@ucr.edu"
        read -p "Enter your Git user email (Default: ${DEFAULT_GIT_EMAIL}): " git_user_email_input
        git_user_email=${git_user_email_input:-$DEFAULT_GIT_EMAIL}
        git config --global user.email "$git_user_email"
    else
        echo "Git user.email is already set to: $CURRENT_GIT_EMAIL"
    fi
    
    echo "Git configuration complete."
else
    echo "Git not found. Skipping Git configuration."
fi


echo "Done! Restart your shell or run 'source ~/.bashrc' to apply changes."
