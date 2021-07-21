#!/bin/bash

# Making folders
mkdir ~/.config/nivm
mkdir ~/.config/nvim/.swp
mkdir ~/.config/nvim/.backup
mkdir ~/.config/nvim/.undo
mv init.vim ~/.config/nvim
rm ~/.bashrc
mv .bashrc ~
