set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'

" Syntastic

Plugin 'scrooloose/syntastic'

" Nerd Commments

Plugin 'scrooloose/nerdcommenter'

" Add You Complete Me

Plugin 'Valloric/YouCompleteMe'

" Vim Instant Markdown

Plugin 'suan/vim-instant-markdown'

" Monokai

Plugin 'crusoexia/vim-monokai'

" vim-javascript

Plugin 'pangloss/vim-javascript'

" vim-javascript-lib companion

Plugin 'crusoexia/vim-javascript-lib'

" DirDiff

Plugin 'will133/vim-dirdiff'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Autostart Line Numbers

set number
filetype plugin on

" Change line color 

highlight LineNr ctermfg=grey 

" New Line Below /2 Keep Cursor on Same Line
" This may need to be changed 

map <Enter> o<ESC>k	

" Indentation without tabs (preference)

set expandtab
set shiftwidth=2
set softtabstop=2

" Width to wrap

set tw=72 

" Syntastic 

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2
set statusline=%f "tail of filename

" Change location list height

let g:syntastic_loc_list_height=2

" Automatically load errors to location list 

let g:syntastic_always_populate_loc_list = 0

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

" Chained for on-demand ':SyntasticCheck <checker>'(auto slowing down system)
let g:syntastic_html_checkers = ['tidy, w3, validator']

" Syntastic Pseudo Icons and ++ 

let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'

" Vanilla autocomplete brackets
" Syntastic ???
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O

" Open help in new tab

cabbrev help tab help
cabbrev h tab h

" Colors
syntax on
colorscheme monokai

" Map ), }, and ] to skip over the exisiting ), }, or ], if it is a closing parenthesis
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Map " and ' to skip over the existing ones if closing.
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

" Change <leader> to ',' instead of '\'
let mapleader=","

"set timeout timeoutlen=1500 <--- option for some kb's / circz

" rename a file within vim -->
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

" type <leader>n to open rename file dialog
map <leader>n :call RenameFile()<cr>
