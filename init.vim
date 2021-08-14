" Plugins
call plug#begin()
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
" File browser
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Code
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'uiiaoo/java-syntax.vim'
" Colorschemes
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-gruvbox8'
call plug#end()

" Colorschemes
set termguicolors
syntax on
set cursorline
set background=dark
colorscheme gruvbox8

" General
set title
set encoding=utf8
set number relativenumber
set incsearch
set hlsearch
set ignorecase
set showmatch
set showcmd
set noerrorbells
set wildmenu
set mouse+=a
set backspace=eol,start,indent
let mapleader=" "
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o
highlight link javaIndentifier NONE
set clipboard=unnamedplus

" Indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set list lcs=tab:\|\

" Backup
autocmd FocusLost * :w<CR>
set undofile

" Splits
set splitright
set splitbelow
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <S-Tab> <C-w>w
nnoremap vv <C-W>v
nnoremap ss <C-W>s

" Mappings
" Open code directory
nnoremap <Leader>j :cd ~\Documents\javaC0de<CR>

" Open buffer for scribble
nnoremap <Leader>q :e ~\Dropbox\Text\buffer<CR>

" Open init.vim
nnoremap <Leader>ev :e $MYVIMRC<CR>

" Open file browser
nnoremap <Leader>n :NERDTreeToggle<CR>

" Compile and see errors for java
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
nnoremap <Leader>c :make<Return>:copen<Return>
nnoremap <Leader>m :cprevious<Return>

" Run java file
nnoremap <Leader>r :!java %:t:r<CR>

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Plugin config
" Airline
let g:airline_powerline_fonts = 1
set t_Co=256
set laststatus=0
set cmdheight=1
set noshowmode
set noruler

" Java Syntax
highlight link javaIdentifier NONE

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusConcealBrackets = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
