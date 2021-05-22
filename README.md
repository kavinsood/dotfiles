# dotfiles

All my dotfiles.

* `.bashrc` contains some useful aliases that I use and fixes dircolors variables in terminal. 
*  `.vimrc` is a minimal vim config to be used in version >= 8.1. All plugins are installed using [vim-plug](https://github.com/junegunn/vim-plug). It allows for completion of everything with tab and has language specific snippets. 
* `init.vim` is my config for Neovim. I use a GUI Client called [Fvim](https://github.com/yatli/fvim). This config is a full IDE replacement. It has full snippets and LSP support with tab completion for everything like VSCode.  

However, it requires some stuff preinstalled - Python and NodeJS. To add support for python, pynvim needs to be installed by `pip3 install pynvim`. Install everything and then open Neovim and do `:checkhealth` to make sure everything is working. ["Jetbrains Mono"](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip) font is my preferred font to use. It comes with patched icons and ligatures. You can change it with your font family, style and size of choice by altering `guifont` variable.

All plugins are installed using [vim-plug](https://github.com/junegunn/vim-plug) again. For the Autocomplete, [Coc.nvim](https://github.com/neoclide/coc.nvim) plugin is used. In Neovim, install extensions for snippets by doing `:CocInstall coc-snippets`. I have Intellisense LSP support for programming in Java. For it, you need JDK 11 installed and $PATH *needs* to be set for it to work. Do `:CocInstall coc-java` and latest jdt.ls will be installed automatically the first time you open a .java file and autocomplete will start working. Again, completion for everything is with tab key.
