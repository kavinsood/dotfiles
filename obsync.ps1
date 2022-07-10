#!/bin/bash
# Sync the obsidian folder with github as a backup and sync platform
# Add the folder containing this file to PATH for easy access

# Move to git repo
cd ~/github/Obsidian

# First all files from onedrive into git repo
rm *

# Move all files from local folder into git repo
cp ~/OneDrive/Obsidian/* .

# Run gitsync script to add, commit and push local changes to branch
gitsync.ps1
