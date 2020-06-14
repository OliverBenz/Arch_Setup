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
