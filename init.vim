" Plugins
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'uiiaoo/java-syntax.vim'
call plug#end()

" General
set nocompatible
set encoding=utf8
set title
set nu rnu
set incsearch
set hlsearch
set ignorecase
set backspace=eol,indent,start
set showmatch
set showcmd
set noerrorbells
let mapleader=" "
set wildmenu
set mouse+=a
set clipboard=unnamedplus
highlight link javaIdentifier NONE

" Indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab

" Backup
set backupdir=~\vimfiles\.backup
set undodir=~\vimfiles\.undo
set directory=~\vimfiles\.swp
set backup
set writebackup
set swapfile
set undofile

" Colorschemes
set termguicolors
syntax on
set background=dark
let g:onedark_high_endofbuffer=1
let g:onedark_terminal_italics=1
colorscheme onedark
set cursorline

" Split
set splitright
set splitbelow
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <S-Tab> <C-w>w
map vv <C-W>v
map ss <C-W>s
nnoremap c "cc
vnoremap c "cc
nnoremap C "cC
vnoremap C "cC
nnoremap d "dd
vnoremap d "dd  
nnoremap D "dD
vnoremap D "dD
nnoremap x "xx
vnoremap x "xx
nnoremap X "xX
vnoremap X "xX

" Mappings
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

" Plugin configs
" NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusConcealBrackets = 1
nnoremap <Leader>n :NERDTreeToggle<CR>

" Coc.nvim make use of tab for all completion
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

" Vim-airline
set laststatus=0
set noshowmode
set noruler
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
