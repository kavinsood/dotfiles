# Syncs a github repository two way in a simple script
# First check if the current directory is a git repo
# if (Test-Path .git -PathType Any) {}
if (Test-Path .git -PathType Any) {
    git pull > $null
    git add -A > $null
    git commit -m "Files added on $(Get-Date)" > $null
    git push > $null
    Write-Output "Done"
}
Write-Output "No git repo found."