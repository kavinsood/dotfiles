" Plugins
call plug#begin()
" File Explorer
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Fuzzy Finder
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Code
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
" Appearance
Plug 'shaunsingh/nord.nvim'
Plug 'uiiaoo/java-syntax.vim'
call plug#end()

" General
set encoding=utf8
set title
set number relativenumber
set showmatch
set showcmd
set noerrorbells
set wildmenu
set mouse+=a
let mapleader=" "
set backspace=eol,start,indent 
set clipboard=unnamedplus

" Search
set incsearch
set hlsearch
set ignorecase

" Disable auto comment in new line
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o

" Appearance
set termguicolors
syntax on
let g:nord_contrast = v:true
let g:nord_borders = v:false
let g:nord_disable_background = v:true
let g:nord_italic = v:false
colorscheme nord
let g:airline_theme="nord_minimal"

" Enable transparency
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE

" Do not highlight identifiers in java
highlight link javaIdentifier NONE

" Indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

" Show indent guide
set list lcs=tab:\|\ 

" Backup
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
" Compile and Run Java 
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
nnoremap <Leader>c :make<Return>:copen<Return>
nnoremap <Leader>m :cprevious<Return>
nnoremap <Leader>r :!java %:t:r<CR>

" Turn off search highlights
nnoremap <Leader><space> :nohlsearch<CR>

" FZF
nnoremap <Leader>f :FZF<CR>

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Code Directory
nnoremap <Leader>j :cd ~\javaC0de<CR>

" Open buffer for scribble
nnoremap <Leader>q :e ~\OneDrive\Text\buffer.txt<CR>

" Open Neovim Config
nnoremap <Leader>ev :e $MYVIMRC<CR>

" Config
" Airline 
set laststatus=0
set cmdheight=1
let g:airline_powerline_fonts = 1

" NERDTree
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
let g:coc_snippet_next = '<tab>'
