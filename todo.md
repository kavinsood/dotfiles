## my arch setup
install arch with lts-kernel, KDE desktop

## pacman
enable parallel downloads
update mirrorlist with reflector
sudo pacman -Syyuu

## AUR helper
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
yay -S envycontrol spotify apple_cursor kwin-effect-rounded-corners-git visual-studio-code-bin onlyoffice-bin ttf-inter teams-for-linux-bin breeze-enhanced-git sddm-sugar-dark power-profiles-daemon proton-vpn-gtk-app

sudo pacman -S man tree unzip fzf fd git wl-clipboard ripgrep bluez-utils firefox neovim discord obs-studio python-pip jdk-openjdk nodejs npm pnpm github-cli fastfetch bpytop qbittorrent obsidian blender okular spectacle gwenview kamoso neovide kdeconnect partitionmanager filelight ttf-jetbrains-mono-nerd otf-commit-mono-nerd ttf-cascadia-mono-nerd syncthing yt-dlp fish fisher pinta tenacity meld telegram-desktop

# bluetooth
sudo systemctl enable bluetooth.service

# syncthing
systemctl enable syncthing.service --user

## clean
sudo pacman -Qtdq | sudo pacman -Rns -
yay -Scc
