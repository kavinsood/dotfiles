# Autocomplete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Aliases
Set-Alias winfetch pwshfetch-test-1
New-Alias open ii
New-Alias l ls
function googleSearch{Start-Process www.google.com/search?q=$args}
Set-Alias g googleSearch

# Starship Prompt
Invoke-Expression (&starship init powershell)