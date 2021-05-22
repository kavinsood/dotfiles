" Vim plug settings
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'uiiaoo/java-syntax.vim'
Plug 'neoclide/coc.nvim'
Plug 'honza/vim-snippets'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
call plug#end()

" Colorschemes 
set termguicolors
syntax on
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
colorscheme onedark

" Indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab

" General settings
set nocompatible
set title
set number
set encoding=utf8
set incsearch
set hlsearch
set ignorecase
set backspace=eol,start,indent
set showmatch
set showcmd
set hidden
set noerrorbells
set clipboard=unnamedplus
let mapleader=","
set matchpairs+=<:> " %
set cursorline
set wildmenu
set spelllang=en_us
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o
set list lcs=tab:\|\ 
set wrap
set linebreak
filetype indent on
filetype plugin indent on
highlight link javaIdentifier NONE
set splitright
set splitbelow
set mouse+=a

" Backup
set undofile
autocmd FocusLost * :wa 

" Faster window movements
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <S-Tab> <C-w>w

" Prevent x from overriding what's in the clipboard
noremap x "_x
noremap X "_x

" Yank support for WSL
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
	augroup WSLYank
		autocmd!
		autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif

" Move normally between wrapped lines
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" Status bar settings
set laststatus=0
set noshowmode
set cmdheight=2
set noruler
set shortmess+=c

" Vim airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
set t_Co=256

" Delete trailing white space on save, useful for some filetypes 
fun! CleanExtraSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	silent! %s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfun

if has("autocmd")
	autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Neovim Gui settings
set guifont=JetbrainsMono\ Nerd\ Font:h14

" Keybindings
" Open a buffer for scribble
map <Leader>q :e C:\Users\Lenovo\Desktop\School\text\buffer.txt

" toggle spell check on f7
inoremap <F7> <C-\><C-O>:setlocal spelllang=en_us spell! spell?<CR>
set complete+=kspell

" F9 to compile, F10 & F11 to cycle through errors in Java
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

" Run java file using F8
map <F8> :!java %:t:r<CR>

" Toggle relative line numbers and regular line numbers
nmap <F6> :setinvrelativenumber<CR>

" Toggle NerdTree with F5
map <Leader>n :NERDTreeToggle<CR>

" Edit Vim config file in a new tab.
map <Leader>ev :e $MYVIMRC<CR>

" Automatically fix the last misspelled word and jump back to where you were.
nnoremap <leader>sp :normal! mz[s1z=`z<CR>

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump
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
