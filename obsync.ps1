# Syncs the obsidian folder in onedrive with github as a backup platform
# Add the folder containing this file to PATH for easy access

# Move to git repo
cd ~/github/obsidian

# First delete all present in the git repo
rm *

# Move all files from onedrive into git repo
cp ~/OneDrive/Obsidian/* .

# Add, commit and push local changes to branch
git add . 
git commit -m "$(Get-date)"
git push