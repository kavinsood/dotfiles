" Plugins
call plug#begin()
" NERDTree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Appearance
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'xiyaowong/nvim-transparent'
" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Fuzzy Finder
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Code
Plug 'jiangmiao/auto-pairs'
Plug 'uiiaoo/java-syntax.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
call plug#end()

" Appearance
set termguicolors
syntax on
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
colorscheme onedark
let g:airline_theme="onedark"
let g:airline_powerline_fonts=1
let g:transparent_enabled = v:true
set shortmess=I
set laststatus=0
set cmdheight=1

" General
let mapleader=" "
set encoding=utf8
set title
set number relativenumber
set showmatch
set showcmd
set noerrorbells
set wildmenu
set mouse+=a
set backspace=eol,start,indent
set clipboard=unnamedplus
set undofile
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o

" Search
set incsearch
set hlsearch
set ignorecase

" Indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set list lcs=tab:\|\ 

" Splits
set splitright
set splitbelow
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap vv <C-W>v
nnoremap ss <C-W>s

" Mappings
" Compile and Run Java
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
nnoremap <Leader>c :make<Return>:copen<Return>
nnoremap <Leader>m :cprevious<Return>
nnoremap <Leader>r :!java %:t:r<CR>

" Turn off search highlight
nnoremap <Leader><space> :nohlsearch<CR>

" Open Fuzzy Finder
nnoremap <Leader>f :Files<CR>

" Open File Explorer
nnoremap <Leader>n :NERDTreeToggle<CR>

" Open code folder
nnoremap <Leader>j :cd ~\Github\javaC0de<CR>

" Open buffer for scribble
nnoremap <Leader>q :e ~\OneDrive\Text\buffer.txt<CR>

" Open nvim config
nnoremap <Leader>ev :e $MYVIMRC<CR>

" Open search for buffers
nnoremap <Leader>b :Buffers<CR>

" Config
" Nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusConcealBrackets = 1

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
let g:coc_snippet_next = '<tab>'" Plugins
call plug#begin()
