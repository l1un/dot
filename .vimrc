set nocompatible              " be iMproved, required
filetype off                  " required

" plugins / vundle
" runtime path to include Vundle and init
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Ale
Plugin 'w0rp/ale'
" Syntastic
" Plugin 'scrooloose/syntastic'
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
" Auto Pairs
Plugin 'jiangmiao/auto-pairs'
" vim-jsx
Plugin 'mxw/vim-jsx'
" Nerdtree
Plugin 'scrooloose/nerdtree'
" lightline
Plugin 'itchyny/lightline.vim'

" --- plugins above here ---

" Vundle
call vundle#end()            " required
filetype plugin indent on    " required

" --- END plugins / vundle ---

" search
set incsearch

" line numbers
" autostart Line Numbers
set number
filetype plugin on
" change line number color 
highlight LineNr ctermfg=grey 

" break / enter
" new line below / cursor stays 
map <Enter> o<ESC>k	

" indent 
set expandtab
set shiftwidth=2
set softtabstop=2

" width / wrap -fix html wrapping 
set tw=0
set wrap
set linebreak
set nolist " list disables linebreak

set statusline+=%#warningmsg#
set statusline+=%*
set laststatus=2
set statusline=%f "tail of filename
" Ale
"React  https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:ale_statusline_format = ['error', 'warning %d', '']
let g:ale_linters = {
\  'javascript': ['stylelint', 'eslint'],
\  'css': ['stylelint', 'eslint'],
\}
" Ale symbols
let g:ale_sign_error = '✗✗'
let g:ale_sign_warning = '∆∆'
let g:ale_echo_msg_warning_str = 'Warning 📣'
let g:ale_echo_msg_error_str = '❧ Error'

" Syntastic 
" set statusline+=%{SyntasticStatuslineFlag()}

" " change location list height
" let g:syntastic_loc_list_height=2
" " automatically load errors to location list 
" let g:syntastic_always_populate_loc_list = 0
" " checks for errors on loading file
" let g:syntastic_auto_loc_list = 1
" " check for erros on open file
" let g:syntastic_check_on_open = 1
" " disable check for errors on save
" let g:syntastic_check_on_wq = 0
" " enables error signs
" let g:sytastic_enable_signs = 1

" " current syntastic Checkers
" let g:syntastic_javascript_checkers = ['eslint']
" " chained for on-demand ':SyntasticCheck <checker>'(auto was slow)
" let g:syntastic_html_checkers = ['tidy, w3, validator']

" " syntastic Pseudo Icons and ++ 
" let g:syntastic_error_symbol = '✗✗'
" let g:syntastic_style_error_symbol = '✠✠'
" let g:syntastic_warning_symbol = '∆∆'
" let g:syntastic_style_warning_symbol = '≈≈'

" help behaviour
" open help in new tab
cabbrev help tab help
cabbrev h tab h

" colors / aesthetics
syntax on
colorscheme monokai

" leader key
" change <leader> to ',' instead of '\'
let mapleader=","
"set timeout timeoutlen=1500 <-- try if too fast 

" rename files within vim (<leader>n to rename)
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

" scrooloose comments
" add spaces to nerd/sexy comments (Standard JS no-warn msg)
let NERDSpaceDelims=1

" nerdtree <F2> toggle
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeAutoDeleteBuffer=1

" unused / saved for later
" *if used to block comment and escape chars...
if 0
i
" vanilla auto complete etc. --> testing autopairs plugin
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O

" Map ), }, and ] to skip over the exisiting ), }, or ], if it is a closing parenthesis
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Map " and ' to skip over the existing ones if closing.
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
.
endif
