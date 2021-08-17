" Plugins
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'uiiaoo/java-syntax.vim'
Plug 'joshdick/onedark.vim'
call plug#end()

" Colorscheme
set termguicolors
syntax on
set cursorline
colorscheme onedark
let g:onedark_terminal_italics=1
let g:onedark_hide_endofbuffer=1

" Indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
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

" General
set encoding=utf8
set number relativenumber
set incsearch
set hlsearch
set ignorecase
set showmatch
set showcmd
set wildmenu
set noerrorbells
set mouse+=a
set backspace=eol,start,indent
let mapleader=" "
set clipboard=unnamedplus
highlight link javaIndentifier NONE
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o

" Mappings
nnoremap <Leader>j :cd ~\Documents\javaC0de<CR>
nnoremap <Leader>q :e ~\Dropbox\Text\buffer<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <leader><space> :nohlsearch<CR>
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
nnoremap <Leader>c :make<Return>:copen<Return>
nnoremap <Leader>m :cprevious<Return>
nnoremap <Leader>r :!java %:t:r<CR>

" Plugins
let g:airline_powerline_fonts = 1
set laststatus=0
set cmdheight=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusConcealBrackets = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
