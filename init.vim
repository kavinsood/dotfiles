" Plugins
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
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
set incsearch
set hlsearch
set ignorecase
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o
set undofile

" Appearance
set termguicolors
syntax on
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
colorscheme onedark
let g:airline_theme="onedark"
highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
highlight link javaIdentifier NONE
set shortmess=I
set laststatus=0
set cmdheight=1
let g:airline_powerline_fonts=1

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
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
nnoremap <Leader>c :make<Return>:copen<Return>
nnoremap <Leader>m :cprevious<Return>
nnoremap <Leader>r :!java %:t:r<CR>
nnoremap <Leader><space> :nohlsearch<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>j :cd ~\javaC0de<CR>
nnoremap <Leader>q :e ~\OneDrive\Text\buffer.txt<CR>
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>b :Buffers<CR>

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
