" Updated 5/5/17 - Change line number color and indentation settings. 

" Pathogen

execute pathogen#infect()

" Toggle Nerdtree.

nnoremap <F4> :NERDTreeToggle<CR>

" Autostart Line Numbers

set number
filetype plugin on

" change line color 

highlight LineNr ctermfg=grey 

" New Line Below / Keep Cursor on Same Line

map <Enter> o<ESC>k	

" Indentation without tabs (preference)

set noexpandtab
set shiftwidth=4
set softtabstop=4

" Auto indent and compete Curly Brackets

set cindent
inoremap { {<CR>}<up><end><CR>
