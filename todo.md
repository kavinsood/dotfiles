## my arch setup
install arch with lts-kernel, KDE desktop

## pacman
enable parallel downloads
update mirrorlist -> singapore
sudo pacman -Syyuu

## yay AUR helper
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
yay -S envycontrol spotify apple_cursor kwin-effect-rounded-corners-git visual-studio-code-bin onlyoffice-bin ttf-inter jetbrains-toolbox bitwarden proton-vpn-gtk-app teams-for-linux-bin nvm breeze-enhanced-git

## download
sudo pacman -S man find tree unzip fzf fd git wl-clipboard ripgrep bluez-utils firefox neovim tlp tlp-rdw discord obs-studio python-pip jdk-openjdk nodejs npm pnpm github-cli fastfetch bpytop qbittorrent obsidian blender okular spectacle gwenview kamoso neovide kdeconnect partitionmanager filelight ttf-jetbrains-mono-nerd otf-commit-mono-nerd ttf-cascadia-mono-nerd syncthing yt-dlp fish fisher pinta tenacity meld speech-dispacher telegram-desktop

# tlp
sudo pacman -S tlp tlp-rdw 
sudo systemctl enable tlp.service
sudo systemctl enable NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket

# envycontrol
sudo envycontrol -s integrated

# bluetooth
sudo systemctl enable bluetooth.service

# syncthing
systemctl enable syncthing.service --user

sudo pacman -Qtdq | sudo pacman -Rns -
yay -Scc
