" Plugins
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'uiiaoo/java-syntax.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" General
set title
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
set clipboard=unnamedplus
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o
let mapleader=" "
highlight link javaIdentifier NONE
set laststatus=0
set cmdheight=1

" Splits
set splitright
set splitbelow
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Mappings
nnoremap <Leader>q :e C:\Users\kavin\Onedrive\Text\buffer<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>ev :e $MYVIMRC<CR>
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
nnoremap <Leader>c :make<Return>:copen<Return>
nnoremap <Leader>m :cprevious<Return>
nnoremap <Leader>r :!java %:t:r<CR>

" Tab autocomplete
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

" Status bar
set laststatus=0
set cmdheight=1

" NERDTree
let NERDTreeShowHidden = 1
let NERDTREEMinimalUI = 1
