## my arch setup
install arch KDE

enable parallel downloads in /etc/pacman.conf

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

yay -Syu --noconfirm envycontrol power-options-webview apple_cursor cursor-bin onlyoffice-bin inter-font teams-for-linux-bin spotify zoom man tree unzip fzf fd wl-clipboard ripgrep bluez-utils neovim discord obs-studio python-pip jdk-openjdk nodejs pnpm npm github-cli fastfetch bpytop qbittorrent obsidian blender okular spectacle gwenview neovide partitionmanager filelight ttf-jetbrains-mono-nerd inter-font otf-commit-mono-nerd yt-dlp fish fisher meld ghostty

sudo systemctl enable bluetooth.service
sudo systemctl enable power-options.service

## clean
sudo pacman -Qtdq | sudo pacman -Rns -
yay -Scc
