" Updated 4/22/17 - Pathogen, Nerdtree, Comments, JavaScript, ... 
" Pathogen

execute pathogen#infect()

" Toggle Nerdtree.

nnoremap <F4> :NERDTreeToggle<CR>

" Autostart Line Numbers

set number
filetype plugin on

" New Line Below / Keep Cursor on Same Line

map <Enter> o<ESC>k	

" Indentation without tabs (preference)

set expandtab
set shiftwidth=2
set softtabstop=2
