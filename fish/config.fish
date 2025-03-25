if status is-interactive
    and not set -q __nitch_ran
    nitch++
    set -g __nitch_ran 1
end

set -g fish_greeting

# Alias for 'open' command
alias ii="xdg-open"
alias l="eza"
alias ls="eza"

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

# Set PNPM_HOME
set -x PNPM_HOME "/home/kavin/.local/share/pnpm"

# Check if PNPM_HOME is already in PATH
if not contains $PATH $PNPM_HOME
    # Prepend PNPM_HOME to PATH
    set -x PATH $PATH $PNPM_HOME
end


set -gx EDITOR nvim
starship init fish | source
