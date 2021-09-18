" Plugins
call plug#begin()
" Fuzzy finder
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" File Browser
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
" Code
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'uiiaoo/java-syntax.vim'
" Colorschemes
Plug 'joshdick/onedark.vim'
call plug#end()

" General
set title
set number relativenumber
set encoding=utf8
set incsearch
set hlsearch
set ignorecase
set showmatch
set showcmd
set noerrorbells
set wildmenu
set mouse+=a
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o
set backspace=eol,start,indent
highlight link javaIdentifier NONE
let mapleader=" "

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
set backupdir=~/.config/nvim/.backup
set directory=~/.config/nvim/.swp
set undodir=~/.config/nvim/.undo
set backup
set writebackup
set swapfile
set undofile

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
" Spell Check
nnoremap <Leader>sp <C-\><C-O>:setlocal spelllang=en_us spell! spell?<CR>
set complete+=kspell

" Compile and run java files
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
nnoremap <Leader>c :make<Return>:copen<Return>
nnoremap <Leader>m :cprevious<Return>
nnoremap <Leader>r :!java %:t:r<CR>

" Turn off search highlight
nnoremap <Leader><space> :nohlsearch<CR>

" Edit Nvim Config
nnoremap <Leader>ev :e $MYVIMRC<CR>

" FZF
nnoremap <Leader>f :FZF<CR>

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle line numbers
nnoremap <Leader>l :setinvrelativenumber<CR>

" Navigate to Code Directory
" TODO

" Open a buffer for scribble
" TODO

" Plugin Config
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

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusConcealBrackets = 1

" Airline
set laststatus=0
set cmdheight=1
let g:airline_powerline_fonts = 1
