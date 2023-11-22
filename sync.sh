#!/bin/bash

# Syncs a GitHub repository two-way in a simple script to run with one line
# Add the folder containing this file to PATH for easy access
# First check if the current directory is a Git repository

if [ -d .git ]; then
    # Always commit before introducing external changes

    if [ -n "$(git status --porcelain)" ]; then
        # Add modified files and commit
        git add .
        git commit -m "$(date)"
        # Stash your local changes
        git stash
        # Update branch to the latest code from the remote server
        git pull
        # Merge your local changes into the latest code
        git stash apply
        # Add, commit, and push local changes to the branch
        git add .
        git commit -m "$(date)"
        git push
    else
        echo "No changes found"
    fi

else
    echo "Git repository not initialized at the current path"
fi

