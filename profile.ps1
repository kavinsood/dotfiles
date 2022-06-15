# Autocomplete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Aliases
Set-Alias winfetch pwshfetch-test-1
New-Alias open ii
New-Alias l ls

# Starship Prompt
Invoke-Expression (&starship init powershell)