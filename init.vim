" Plugins
call plug#begin()
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
call plug#end()

" General
set title
set number relativenumber
set encoding=utf8
set incsearch
set hlsearch
set ignorecase
set backspace=eol,start,indent
set showmatch
set showcmd
set wildmenu
set noerrorbells
set clipboard=unnamedplus
let mapleader=" "
set wrap
highlight link javaIdentifier NONE
set mouse+=a
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o

" Colorschemes
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

" Mappings
" Spell check
nnoremap <Leader>sp <C-\><C-O>:setlocal spelllang=en_us spell! spell?<CR>
set complete+=kspell

" Compile, check errors, run java files
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
nnoremap <Leader>c :make<Return>:copen<Return>
nnoremap <Leader>m :cprevious<Return>
nnoremap <Leader>r :!java %:t:r<CR>

" Turn off search highlight
nnoremap <Leader><space> :nohlsearch<CR>

" Edit vim config
nnoremap <Leader>ev :e $MYVIMRC<CR>

" FZF
nnoremap <Leader>f :FZF<CR>

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Autocomplete and Snippets using Tab
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

