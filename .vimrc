set nocompatible              " be iMproved, required
filetype off                  " required

" plugins / vundle
" runtime path to include Vundle and init
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" vundle
Plugin 'VundleVim/Vundle.vim'
" Ale
Plugin 'w0rp/ale'
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
" lightline
Plugin 'itchyny/lightline.vim'
" fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" codi (code scratchpad)
Plugin 'metakirby5/codi.vim'

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
\  'javascript': ['stylelint', 'eslint', 'prettier'],
\  'css': ['stylelint', 'eslint'],
\}
" Ale symbols
let g:ale_sign_error = '✗✗'
let g:ale_sign_warning = '∆∆'
" let g:ale_echo_msg_warning_str = 'Warning'
" let g:ale_echo_msg_error_str = '❧ Error'

" Ale fixing
let g:ale_fixers = {
\  'javascript': ['eslint'],
\}
" Ale completion
let g:ale_completion_enabled = 1

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

" buffer workflow - ',b to list buffers and prep :b'
nnoremap <Leader>b :ls<CR>:b<Space>
" lightline directory path
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }
" codi options
" codi on right
let g:codi#rightsplit = 0
" width on open
let g:codi#width = 70 
" default align left
let g:codi#rightalign = 0 

" test fzf completion
" inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
