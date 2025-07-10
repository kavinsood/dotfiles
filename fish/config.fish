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

# Set PNPM_HOME
set -x PNPM_HOME "/home/kavin/.local/share/pnpm"

# Check if PNPM_HOME is already in PATH
if not contains $PATH $PNPM_HOME
    # Prepend PNPM_HOME to PATH
    set -x PATH $PATH $PNPM_HOME
end


set -gx EDITOR nvim
starship init fish | source

# Environment variables
set -x EDITOR nvim
set -x SUDO_EDITOR $EDITOR

# Initialize zoxide for smart directory navigation
if command -q zoxide
    zoxide init fish | source
end

# Source fzf key bindings if available
if test -f /usr/share/fzf/key-bindings.fish
    source /usr/share/fzf/key-bindings.fish
end

# Add custom directories to PATH
fish_add_path $HOME/.local/bin $HOME/.local/share/omarchy/bin

# File system aliases
alias ls 'eza -lh --group-directories-first --icons=auto'
alias lsa 'ls -a'
alias lt 'eza --tree --level=2 --long --icons --git'
alias lta 'lt -a'
alias ff "fzf --preview 'bat --style=numbers --color=always {}'"

# Directory navigation aliases
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'

# Git alias (only gcm)
alias gcm 'git commit -m'

# Package management function
function yayf
    yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S
end

# Compression functions
function compress --argument dir
    set dir (string trim --right --chars '/' $dir)
    tar -czf "$dir.tar.gz" $dir
end

alias decompress 'tar -xzf'

# Web app launcher functions
function web2app --argument AppName AppURL IconURL
    if test (count $argv) -ne 3
        echo "Usage: web2app <AppName> <AppURL> <IconURL>"
        return 1
    end
    set ICON_DIR "$HOME/.local/share/applications/icons"
    set DESKTOP_FILE "$HOME/.local/share/applications/$AppName.desktop"
    set ICON_PATH "$ICON_DIR/$AppName.png"
    mkdir -p $ICON_DIR
    if not curl -sL -o $ICON_PATH $IconURL
        echo "Error: Failed to download icon."
        return 1
    end
    echo "[Desktop Entry]
Version=1.0
Name=$AppName
Comment=$AppName
Exec=firefox --new-window "$AppURL"
Terminal=false
Type=Application
Icon=$ICON_PATH
StartupNotify=true" > $DESKTOP_FILE
    chmod +x $DESKTOP_FILE
end

function web2app-remove --argument AppName
    if test (count $argv) -ne 1
        echo "Usage: web2app-remove <AppName>"
        return 1
    end
    set ICON_DIR "$HOME/.local/share/applications/icons"
    set DESKTOP_FILE "$HOME/.local/share/applications/$AppName.desktop"
    set ICON_PATH "$ICON_DIR/$AppName.png"
    rm $DESKTOP_FILE
    rm $ICON_PATH
end

# XCompose refresh function
function refresh-xcompose
    pkill fcitx5
    setsid fcitx5 &>/dev/null &
end

# Fn key fix alias
alias fix_fkeys 'echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode'

# Custom zd function for directory navigation
function zd
    if test (count $argv) -eq 0
        cd ~
    else if test -d $argv[1]
        cd $argv[1]
    else
        __zoxide_z $argv
        if test $status -eq 0
            echo " \U000F17A9 "
            pwd
        else
            echo "Error: Directory not found"
        end
    end
end

# Open function
function open
    xdg-open $argv >/dev/null 2>&1
end
