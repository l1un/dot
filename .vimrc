" Updated 5/5/13 - Added, Syntastic, added standardjs and html tidy, removed Overflow HL, removed Pathogen,
" removed NerdTree, various other edits..  

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
"
Plugin 'VundleVim/Vundle.vim'

" Syntastic
"
Plugin 'scrooloose/syntastic'

" Nerd Commments

Plugin 'scrooloose/nerdcommenter'

" Add You Complete Me

Plugin 'Valloric/YouCompleteMe'

" " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

" Pathogen

"execute pathogen#infect()

" Toggle Nerdtree.

nnoremap <F4> :NERDTreeToggle<CR>

" Autostart Line Numbers

set number
filetype plugin on

" Change line color 

highlight LineNr ctermfg=grey 

" New Line Below / Keep Cursor on Same Line

map <Enter> o<ESC>k	

" Indentation without tabs (preference)

set noexpandtab
set shiftwidth=2
set softtabstop=2

" Width to wrap

set tw=72 

" Tern enable keyboard shortcuts

let g:tern_map_keys=1

" Tern show argument hints

let g:tern_show_argument_hints='on_hold'

" Syntastic 

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Automatically load errors to location list 

let g:syntastic_always_populate_loc_list = 1

" Checks for errors on loading file

let g:syntastic_auto_loc_list = 1

" Check for erros on open file

let g:syntastic_check_on_open = 1

" Disable check for errors on save

let g:syntastic_check_on_wq = 0

" Enables error signs

let g:sytastic_enable_signs = 1

" Current syntastic Checkers

let g:syntastic_javascript_checkers = ['standard']


let g:syntastic_html_checkers = ['tidy']

" Vanilla autocomplete brackets

ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
