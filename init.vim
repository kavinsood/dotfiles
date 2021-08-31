" Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim' { 'branch': 'release' }
Plug 'honza/vim-snippets'
Plug 'uiiaoo/java-syntax.vim'
Plug 'joshdick/onedark.vim'
call plug#end()

" General
set title
set nuber relativenumber
set encoding=utf8
set incsearch
set hlsearch
set ignorecase
set backspace=eol,start,indent
set showmatch
set showcmd
set noerrorbells
set clipboard=unnamedplus
let mapleader=" "
set wildmenu
set wrap
highlight link javaIdentifier NONE
set mouse+=a
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o
set laststatus=0

" Colorscheme
set termguicolors
syntax on
colorscheme onedark
set cursorline
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1

" Indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set lcs list=tab:\|\ 

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

" Mappings
nnoremap <Leader>q :e! C:\Users\kavin\Onedrive\Text\Buffer.txt<CR>
nnoremap <Leader>ev :e! $MYVIMRC<CR>
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
nnoremap <Leader>c :make<Return>:copen<Return>
nnoremap <Leader>m :cprevious<Return>
nnoremap <Leader>r :!java %:t:r<CR>

" Plugin config
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
