" Plugins
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'uiiaoo/java-syntax.vim'
call plug#end()

" General
set encoding=utf8
set title
set incsearch
set hlsearch
set ignorecase
set noerrorbells
set wildmenu
set mouse+=a
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o
set backspace=eol,start,indent
set clipboard=unnamedplus
let mapleader=" "
highlight link javaIdentifier NONE
set fillchars=fold:\ ,vert:\???,eob:\ ,msgsep:???
set shm+=I

" Appearance
set termguicolors
syntax on
let g:onedark_terminal_italics=1
let g:onedark_hide_endofbuffer=1
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE
set laststatus=0
set noshowmode
set noruler
set lines+=1
let s:hidden_all=1
set noshowcmd

" Indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

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

" Turn off search highlight
nnoremap <Leader><space> :nohlsearch<CR>

" FZF
nnoremap <Leader>f :FZF<CR>

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle line numbers
nnoremap <Leader>l :setinvrelativenumber<CR>

" Code Directory
" todo

" Open buffer
nnoremap <Leader>q :e C:\Users\money\OneDrive\Text\buffer.txt<CR>

" Open Nvim Config
nnoremap <Leader>ev :e $MYVIMRC<CR>

" Plugin Config
" NERDTree
let NERDTreeShowHidden=1
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
