if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

# Alias for 'open' command
alias ii="xdg-open"
alias l="ls"

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
if not contains $PNPM_HOME $PATH
    # Prepend PNPM_HOME to PATH
    set -x PATH $PNPM_HOME $PATH
end

export EDITOR=nvim
