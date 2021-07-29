#Requires -RunAsAdministrator

# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install neovim
choco install -f neovim

# Make neovim directories
mkdir ~/AppData/Local/nvim
mkdir ~/vimfiles/.swp
mkdir ~/vimfiles/.backup
mkdir ~/vimfiles/.undo


# Install vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# Move the files
mv init.vim ~/AppData/Local/nvim/

# Install dependencies for plugins
choco install -f python pip nodejs 

npm install -g neovim
pip install pynvim
echo ""
echo "Done!"
