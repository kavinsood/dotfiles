#!/bin/fish
function git-sync
    # Check if the commit message is provided
    if test (count $argv) -eq 0
        echo "Error: Commit message is required"
        return 1
    end

    set commitMessage $argv[1]

    # Check if the current directory is a Git repository
    if not test -d .git
        echo "Error: Git repository not initialized at current path"
        return 1
    end

    # Check for uncommitted changes and commit them
    if git status --porcelain | grep -q .
        git add .
        git commit -m "$commitMessage"
    end

    # Stash any remaining changes, including untracked files
    git stash --include-untracked

    # Pull latest changes from remote, rebase local commits
    if not git pull --rebase
        # Check for merge conflicts
        set conflictFiles (git diff --name-only --diff-filter=U)
        if test -n "$conflictFiles"
            echo "Merge conflicts detected in the following files:"
            echo $conflictFiles # Exit the script to allow manual conflict resolution
            return 1
        else
            echo "Error: Failed to pull latest changes from remote"
            return 1
        end
    end

    # Apply stashed changes, if any
    if git stash list | grep -q .
        git stash pop --index
        # Check for conflicts after applying the stash
        if git status --porcelain | grep -q .
            git add .
            git commit -m "$commitMessage"
        else
            echo "No changes to commit after applying stash"
        end
    end

    # Push local changes to remote
    if not git push
        echo "Error: Failed to push local changes to remote"
        return 1
    end

    echo "Git sync completed successfully"
end
