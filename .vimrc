" Custom Configuration
"------------------------

"Enable Numbered lines
set number

"Colored syntax
syntax on

"F7 to switch to next tab
map <F7> :tabp <CR>

"F8 to switch to prev tab
map <F8> :tabn <CR>

"F6 to open new file
map <F6> :tabe

"Tabulator
set tabstop=4
set softtabstop=4 noexpandtab
set shiftwidth=4

"Mark char110 -> vim automatically breaks lines starting with the 11th char in line
set wrap
set smartindent
set incsearch

" Relative Line Numbers
set relativenumber

" Disable Arrow Keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>


" Load plugins using vim-plug
call plug#begin()
	Plug 'preservim/nerdtree'
call plug#end()



""" PLUGING SETUP

"" NERDTree
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
