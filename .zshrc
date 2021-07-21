# Use powerline
USE_POWERLINE="true"
fortune -s | lolcat
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
# aliases. oh dont we all love them
alias open="xdg-open"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias df='df -h'
alias free='free -m'
alias np='nano -w PKGBUILD'
alias sl='ls'
alias vim='nvim'
alias vi='nvim'
alias gpom="git push origin master"
alias wifikey="sudo grep -r '^psk=' /etc/NetworkManager/system-connections/"

# Gif to webm
gif2webm() {
    ffmpeg -i $1.gif -c vp9 -b:v 0 -crf 41 $1.webm
}
