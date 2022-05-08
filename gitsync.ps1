# Syncs a github repository two way in a simple script
# First check if the current directory is a git repo
# Add the folder containing this file to system variables for easy access

if (Test-Path .git -PathType Any) {
    git pull
    git add -A
    git commit -m "Files added on $(Get-Date)"
    git push
    Write-Output "Done"
}
else {
    Write-Output "No git repo found."
}
