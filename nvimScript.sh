#!/bin/bash
# Nvim setup script

# Making folders for backup
mkdir ~/.backup
mkdir ~/.swp
mkdir ~/.undo

# Making nvim config directory
mkdir ~/.config/nvim/

# Moving init.vim
mv init.vim ~/.config/nvim/

# Final message
echo "All done!"
