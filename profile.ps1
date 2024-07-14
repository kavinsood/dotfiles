# Autocomplete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Aliases
New-Alias ls eza -Force
New-Alias l eza
New-Alias open ii
function googleSearch{Start-Process www.google.com/search?q=$args}
Set-Alias g googleSearch
function perplexitySearch{Start-Process www.perplexity.ai/search?q=$args}
Set-Alias p perplexitySearch

# Starship Prompt
Invoke-Expression (&starship init powershell)

