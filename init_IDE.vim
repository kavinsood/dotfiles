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
Plug 'tpope/vim-fugitive'
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
set mouse=a
set signcolumn=yes

" Backup
set undofile
autocmd FocusLost * :wa 

" Faster window movements
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <S-Tab> <C-w>w

" Open new splits easily
map vv <C-W>v
map ss <C-W>s
map Q  <C-W>q

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
set cmdheight=2
set noshowmode
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

" NerdTree settings
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

" Keybindings
" Open a buffer for scribble
map <Leader>q :e C:\Users\Lenovo\Desktop\School\text\buffer.txt <CR>

" toggle spell check on f7
inoremap <F7> <C-\><C-O>:setlocal spelllang=en_us spell! spell?<CR>
set complete+=kspell

" ,c to Compile. ,m to jump to next error
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <Leader>c :make<Return>:copen<Return>
map <Leader>m :cprevious<Return>

" Run java file using ,r
map <Leader>r :!java %:t:r<CR>

" Toggle relative line numbers and regular line numbers with ,l
nmap <F6> :setinvrelativenumber<CR>

" Toggle NerdTree with Leader n
map <Leader>n :NERDTreeToggle<CR>

" Remove highlighted search term with ,f
map <Leader>f let @/="" <CR>

" Edit Nvim config file in a new tab.
map <Leader>ev :e $MYVIMRC<CR>

" Navigate to code directory
map <Leader>j :cd C:\Users\Lenovo\Desktop\School\javaC0de<CR>

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

" Use powershell instead of cmd
set shell=powershell shellquote=( shellpipe=\| shellxquote=
                  set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
				                    set shellredir=\|\ Out-File\ -Encoding\ UTF8)

" Coc.nvim settings
set updatetime=300

" Setting number of completions to 10 cause what type of a monster do you need to be to require 300
set pumheight=20

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
