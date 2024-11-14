## my arch setup
install arch KDE

## pacman
enable parallel downloads
sudo pacman -Syyuu

## AUR helper
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

yay -S --noconfirm envycontrol apple_cursor visual-studio-code-bin onlyoffice-bin ttf-inter teams-for-linux-bin sddm-sugar-dark auto-cpufreq spotify zoom

sudo pacman -Syyuu --noconfirm man tree unzip fzf fd git wl-clipboard ripgrep bluez-utils firefox neovim discord obs-studio python-pip jdk-openjdk nodejs npm pnpm github-cli fastfetch bpytop qbittorrent obsidian blender okular spectacle gwenview neovide partitionmanager filelight ttf-jetbrains-mono-nerd otf-commit-mono-nerd yt-dlp fish fisher pinta tenacity meld tlp tlp-rdw 

sudo systemctl enable bluetooth.service
sudo systemctl enable tlp.service
sudo systemctl enable NetworkManager-dispatcher.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
sudo systemctl enable auto-cpufreq

## clean
sudo pacman -Qtdq | sudo pacman -Rns -
yay -Scc
