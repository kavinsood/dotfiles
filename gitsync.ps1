# Syncs a github repository two way in a simple script to run with one line
# Add the folder containing this file to PATH for easy access
# First check if the current directory is a git repo
if (Test-Path .git -PathType Any) {
    # Always commit before introducing external changes
    if("$(git status --porcelain)") {
        git add .
        git commit -m "Committing local changes before merge"
        # Stash your local changes
        git stash
        # Update the branch to the latest code
        git pull
        # Merge your local changes into the latest code
        git stash apply
        # Add, commit and push local changes to branch
        git add .
        git commit -m "Files added on $(date)"
        git push
    }
}
