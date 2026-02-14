set -g fish_greeting

# Function for Google search
function g
    set search_query (string join '+' $argv)
    open "https://www.google.com/search?q=$search_query"
end

# Function for Perplexity search
function p
    set search_query (string join '+' $argv)
    open "https://www.perplexity.ai/search?q=$search_query"
end

# Environment variables
set -gx EDITOR nvim
set -gx SUDO_EDITOR $EDITOR
set -gx PAGER "bat --plain"
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# fzf defaults — use fd for file/directory discovery
set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "fd --type d --hidden --follow --exclude .git"

# Initialize tools
starship init fish | source
atuin init fish | source

# Initialize zoxide for smart directory navigation
if command -q zoxide
    zoxide init fish | source
end

# Source fzf key bindings if available
if test -f /usr/share/fzf/key-bindings.fish
    source /usr/share/fzf/key-bindings.fish
end

# File system aliases
alias ls 'eza -h --group-directories-first --icons=auto'
alias lsa 'ls -a'
alias lt 'eza --tree --level=2 --long --icons --git'
alias lta 'lt -a'
alias ff "fzf --preview 'bat --style=numbers --color=always {}'"
alias copy "wl-copy"

# Modern tool replacements
alias cat 'bat --paging=never'
alias diff 'delta'
alias lg 'lazygit'
alias top 'btop'
alias du 'dust'
alias df 'duf'
alias ps 'procs'
alias grep 'rg'

# Git aliases
alias gcm 'git commit -m'
alias gst 'git status'
alias gd 'git diff'
alias gds 'git diff --staged'
alias gl 'git log --oneline -20'
set -gx OPENCODE_DISABLE_AUTOCOMPACT true


# Open function
function ii
    xdg-open $argv >/dev/null 2>&1
end
export PATH="$HOME/.local/bin:$PATH"

# opencode
fish_add_path /home/kavin/.opencode/bin
