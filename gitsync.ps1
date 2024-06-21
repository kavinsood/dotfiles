param (
    [Parameter(Mandatory=$true)]
    [string]$commitMessage
)

# Check if the current directory is a Git repository
if (-not (Test-Path .git -PathType Container)) {
    Write-Error "Git repository not initialized at current path"
    exit 1
}

# Check for uncommitted changes and commit them
if (git status --porcelain) {
    git add .
    git commit -m "$commitMessage"
}

# Stash any remaining changes, including untracked files
git stash --include-untracked

# Pull latest changes from remote, rebase local commits
$pullResult = git pull --rebase
if ($LASTEXITCODE -ne 0) {
    # Check for merge conflicts
    $conflictFiles = git diff --name-only --diff-filter=U
    if ($conflictFiles) {
        Write-Output "Merge conflicts detected in the following files:"
        Write-Output $conflictFiles
        # Exit the script to allow manual conflict resolution
        exit 1
    } else {
        Write-Error "Failed to pull latest changes from remote"
        exit 1
    }
}

# Apply stashed changes, if any
if (git stash list) {
    git stash pop --index
    # Check for conflicts after applying the stash
    if (git status --porcelain) {
        git add .
        git commit -m "$commitMessage"
    } else {
        Write-Output "No changes to commit after applying stash"
    }
}

# Push local changes to remote
git push
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to push local changes to remote"
    exit 1
}

Write-Output "Git sync completed successfully"
