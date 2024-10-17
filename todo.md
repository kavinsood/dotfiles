## my arch setup
install arch with lts-kernel, KDE desktop

## pacman
enable parallel downloads
update mirrorlist with reflector
sudo pacman -Syyuu

## AUR helper
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
yay -S --noconfirm envycontrol apple_cursor visual-studio-code-bin onlyoffice-bin ttf-inter teams-for-linux-bin sddm-sugar-dark auto-cpufreq
sudo pacman -Syyuu man tree unzip fzf fd git wl-clipboard ripgrep bluez-utils firefox neovim discord obs-studio python-pip jdk-openjdk nodejs npm pnpm github-cli fastfetch bpytop qbittorrent obsidian blender okular spectacle gwenview neovide partitionmanager filelight ttf-jetbrains-mono-nerd otf-commit-mono-nerd yt-dlp fish fisher pinta tenacity meld tlp tlp-rdw --noconfirm

sudo systemctl enable bluetooth.service
sudo systemctl enable tlp.service
sudo systemctl enable NetworkManager-dispatcher.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
sudo systemctl enable auto-cpufreq

## clean
sudo pacman -Qtdq | sudo pacman -Rns -
yay -Scc

## mirrors
Server = https://mirror.osbeck.com/archlinux/$repo/os/$arch
Server = http://mirror.sg.gs/archlinux/$repo/os/$arch
Server = https://mirror.sg.gs/archlinux/$repo/os/$arch
Server = http://mirror.xtom.com.hk/archlinux/$repo/os/$arch
Server = http://arch.niranjan.co/$repo/os/$arch
Server = https://arch.niranjan.co/$repo/os/$arch
Server = http://archlinux.uk.mirror.allworldit.com/archlinux/$repo/os/$arch
Server = https://mirrors.pidginhost.com/arch/$repo/os/$arch
Server = https://asia.mirror.pkgbuild.com/$repo/os/$arch
Server = http://mirror.ditatompel.com/archlinux/$repo/os/$arch
Server = https://mirror.ditatompel.com/archlinux/$repo/os/$arch
Server = https://london.mirror.pkgbuild.com/$repo/os/$arch
Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
Server = http://mirror.moson.org/arch/$repo/os/$arch
Server = http://mirrors.cat.net/archlinux/$repo/os/$arch
Server = https://mirror.cyberbits.eu/archlinux/$repo/os/$arch
Server = https://ftp.myrveln.se/pub/linux/archlinux/$repo/os/$arch
Server = https://europe.mirror.pkgbuild.com/$repo/os/$arch
Server = http://mirror.cyberbits.eu/archlinux/$repo/os/$arch
Server = https://arch.yhtez.xyz/$repo/os/$arch
Server = http://arch.yhtez.xyz/$repo/os/$arch
Server = https://mirror.worldhotspot.org/archlinux/$repo/os/$arch
Server = https://sydney.mirror.pkgbuild.com/$repo/os/$arch
Server = http://de.arch.niranjan.co/$repo/os/$arch
Server = http://arch.sakamoto.pl/$repo/os/$arch
Server = https://arch.sakamoto.pl/$repo/os/$arch
Server = http://mirror.ams1.nl.leaseweb.net/archlinux/$repo/os/$arch
Server = http://mirrors.jlu.edu.cn/archlinux/$repo/os/$arch
Server = https://mirror.quantum5.ca/archlinux/$repo/os/$arch
Server = http://mirrors.pidginhost.com/arch/$repo/os/$arch
Server = https://repo.jing.rocks/archlinux/$repo/os/$arch
Server = http://arlm.tyzoid.com/$repo/os/$arch
Server = http://us.arch.niranjan.co/$repo/os/$arch
Server = https://theswissbay.ch/archlinux/$repo/os/$arch
Server = https://mirror.qctronics.com/archlinux/$repo/os/$arch
Server = http://ftp.sh.cvut.cz/arch/$repo/os/$arch
Server = http://ftp.nluug.nl/os/Linux/distr/archlinux/$repo/os/$arch
