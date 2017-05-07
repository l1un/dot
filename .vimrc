" Updated 5/5/7 - Added Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

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

execute pathogen#infect()

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
set shiftwidth=4
set softtabstop=4
