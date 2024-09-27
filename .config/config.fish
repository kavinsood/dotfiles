if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

# Alias for 'open' command
alias open="xdg-open"

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


