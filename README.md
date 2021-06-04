# dotfiles

All my dotfiles.

* `.bashrc` contains very useful aliases that I use and it fixes dircolors in terminal (in WSL). 

* `init_TE.vim` is a minimal config for Neovim. TE is text editor. All plugins are installed using [vim-plug](https://github.com/junegunn/vim-plug). It has tab completion and snippet support. It looks beautiful and opens instantly. This is what I currently use. 

* `init_IDE.vim` is an IDE replacement in Neovim. I use a GUI client called [Fvim](https://github.com/yatli/fvim), though it works completely fine in the terminal. It has full LSP + Snippets + General completion with just Tab. It requires Python and NodeJS to be installed. Pynvim is required which can be installed by `pip3 install pynvim`. Open Neovim and do `:checkhealth` to make sure everything is working. ["Jetbrains Mono"](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip) font is my preferred font to use. It comes with patched icons and ligatures. You can change it with your font family, style and size of choice by altering `guifont` variable. Again, all plugins are installed using [vim-plug](https://github.com/junegunn/vim-plug). For the Autocomplete, [Coc.nvim](https://github.com/neoclide/coc.nvim) plugin is used. In Neovim, install extensions for snippets by doing `:CocInstall coc-snippets`. I have Intellisense LSP support for programming in Java. For it, you need JDK 11 installed and $PATH *needs* to be set for it to work. Do `:CocInstall coc-java` and latest jdt.ls will be installed automatically the first time you open a .java file and autocomplete will start working. Again, completion for everything is with tab key.
