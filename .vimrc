" Plugins
call plug#begin()
" Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" File browser
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Code
Plug 'uiiaoo/java-syntax.vim'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Colorschemes
Plug 'lifepillar/gruvbox8'
Plug 'joshdick/onedark.vim'
call plug#end()

" Colorscheme
set termguicolors
syntax on
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox8
set cursorline

" General settings
set nocompatible
set nu rnu
set title
set encoding=utf8
set incsearch
set hlsearch
set ignorecase
set backspace=eol,start,indent
set showmatch
set showcmd
set noerrorbells
set lazyredraw
let mapleader=" "
set matchpairs+=<:>
set wildmenu
set spelllang=en_us
set foldenable
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o
set splitright
set splitbelow
set mouse+=a
highlight link javaIdentifier NONE

" Indenting settings
filetype indent on
filetype plugin indent on
set list lcs=tab:\|\ 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smarttab
set smartindent
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//
set backup
set writebackup
set swapfile
set undofile

" Statusline settings
let g:airline_powerline_fonts = 1
set cmdheight=1
set noshowmode
set noruler

" Better window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <S-Tab> <C-w>w

" Plugin configurations
" NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusConcealBrackets = 1
nnoremap <Leader>n :NERDTreeToggle<CR>

" Coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

" Keybindings
" Open todo file
nnoremap <Leader>q :e /mnt/c/Users/money/School/text/myplan.txt <CR>

" Toggle spell check
nnoremap <Leader>sp <C-\><C-O>:setlocal spelllang=en_us spell! spell?<CR>
set complete+=kspell

" Compile and move through errors in java file
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <Leader>c :make<Return>:copen<Return>
map <Leader>m :cprevious<Return>

" Run java file
map <Leader>r :!java %:t:r<CR>

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Edit vim config file in a new tab
map <Leader>ev :e $MYVIMRC<CR>

" highlight last inserted text
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>

" Automatically fix the last misspelled word and jump back to where you were
nnoremap <leader>w :normal! mz[s1z=`z<CR>`]

" Proper clipboard sync
" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
	augroup WSLYank
		autocmd!
		autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif
