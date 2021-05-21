" vim plug settings
call plug#begin()
" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" file browsing
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" remove highlighting
Plug 'haya14busa/is.vim'
" code
Plug 'jiangmiao/auto-pairs'
Plug 'uiiaoo/java-syntax.vim'
Plug 'ervandew/supertab'
"Plug 'vim-scripts/AutoComplPop'
"Plug 'neoclide/coc.nvim'
" Distraction free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

" colorschemes
set termguicolors
syntax on
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
colorscheme onedark

" indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab

" general settings
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
set clipboard=unnamedplus
let mapleader=","
set matchpairs+=<:> " %
set cursorline
set wildmenu
set spelllang=en_us
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o
set list lcs=tab:\|\ 
set wrap
set linebreak
filetype indent on
filetype plugin indent on
highlight link javaIdentifier NONE
set splitright
set splitbelow

" backup
set undodir=/tmp
set undofile
autocmd FocusLost * :wa
set directory^=/home/bawse69/.vim/vim-temp/

" faster window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Cycle through splits
nnoremap <S-Tab> <C-w>w

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

" Automatically fix the last misspelled word and jump back to where you were.
nnoremap <leader>sp :normal! mz[s1z=`z<CR>

" Move normally between wrapped lines
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" Mouse settings
set mouse=a
set ttymouse=sgr

" Yank support for WSL
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
	augroup WSLYank
		autocmd!
		autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif

" Remove default status bar
set noshowmode
set laststatus=0
set cmdheight=1
set noruler
set shortmess+=c

" Delete trailing white space on save, useful for some filetypes 
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Vim airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
set t_Co=256

" Goyo settings
autocmd! USer GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Keybindings
" Quickly open a buffer for scribble
map <leader>q :e /mnt/c/users/lenovo/desktop/school/text/buffer.txt<CR>

" spell check on f7
inoremap <F7> <C-\><C-O>:setlocal spelllang=en_us spell! spell?<CR>
set complete+=kspell

" F9 to compile, F10 & F11 to cycle through errors in Java
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

" Run java file using F8
map <F8> :!java %:t:r<CR>

" Toggle relative line numbers and regular line numbers.
nmap <F6> :set invrelativenumber<CR>

" Open Nerdtree with F5
map <F5> :NERDTreeToggle<CR>

" Ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
