" Vim plug settings
call plug#begin()
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" File browser
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Code
Plug 'jiangmiao/auto-pairs'
Plug 'uiiaoo/java-syntax.vim'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'
" Minimalistic Editing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Colorschemes
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'arcticicestudio/nord-vim'
call plug#end()

" Colorschemes
set termguicolors
syntax on
colorscheme nord

" Indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab

" General settings
set nocompatible
set title
set number
set encoding=utf8
set incsearch
set hlsearch
set ignorecase
set backspace=eol,start,indent
set showmatch
set showcmd
set hidden
set noerrorbells
let mapleader=","
set cursorline
set matchpairs+=<:>
set wildmenu
set spelllang=en_us
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o
set list lcs=tab:\|\ 
filetype indent on
filetype plugin indent on
set splitright 
set splitbelow
highlight link javaIndentifier NONE
set mouse+=a

" Backup and persistent undo
set noswapfile
set nobackup
autocmd FocusLost * :wa
set undodir=~/.undodir
set undofile

" Use powershell for commands
set shell=powershell shellquote=( shellpipe=\| shellredir=> shellxquote=
    set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command)

" Faster window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <S-Tab> <C-w>w

" Plugin config
" Vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
set t_Co=256
set laststatus=0
set cmdheight=1
set noshowmode
set noruler

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusConcealBrackets = 1
map <Leader>n :NERDTreeToggle<CR>

" Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Delete trailing white space on save
fun! CleanExtraSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	silent! %s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfun

if has("autocmd")
	autocmd BufWritePre *.txt,*.js,*.py,*.sh,*.md,*.java :call CleanExtraSpaces()
endif

" Keybindings
" Open a buffer for scribble
map <Leader>q :e C:\Users\Lenovo\Desktop\School\text\buffer.txt <CR>

" Toggle spell check
inoremap <Leader>sp <C-\><C-O>:setlocal spelllang=en_us spell! spell?<CR>
set complete+=kspell

" Compile and move through errors in java file
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <Leader>c :make<Return>:copen<Return>
map <Leader>m :cprevious<Return>

" Run java file
map <Leader>r :!java %:t:r<CR>

" Toggle relative line numbers and regular line numbers
nmap <Leader>l :setinvrelativenumber<CR>

" Edit Nvim config file in a new tab
map <Leader>ev :e $MYVIMRC<CR>

" Navigate to code directory
map <Leader>j :cd C:\Users\Lenovo\Desktop\School\javaC0de<CR>

" Automatically fix the last misspelled word and jump back to where you were.
nnoremap <leader>w :normal! mz[s1z=`z<CR>`]
