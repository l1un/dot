" Updated 4/23/17 - Test Auto indent / Complete Command 
"
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

" Auto indent and compete Curly Brackets

set autoindent
set cindent
inoremap { {<CR>}<up><end><CR>
