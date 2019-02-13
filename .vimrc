set nocompatible              " be iMproved, required
filetype off                  " required

" plugins / vundle (vim +PluginInstall +qall)
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
" surround.vim
Plugin 'tpope/vim-surround'
" repeat.vim
Plugin 'tpope/vim-repeat'
" indent guides
Plugin 'thaerkh/vim-indentguides'
" utltisnips 
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" --- plugins above here ---

" Vundle
call vundle#end()            " required
filetype plugin indent on    " required

" --- END plugins / vundle ---

" search and see regEx matches while typing
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
" Worp Ale
"React  https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:ale_statusline_format = ['error', 'warning %d', '']
let g:ale_linters = {
\  'javascript': ['stylelint', 'eslint', 'prettier'],
\  'css': ['stylelint', 'eslint'],
\}
" Ale symbols
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '∆'

" Ale fixing
let g:ale_fixers = {
\  'javascript': ['eslint'],
\}
" FIXME: issues with line number duplication
" hide Ale gutter 
" let g:ale_set_signs = 0
" always show Ale gutter 
let g:ale_sign_column_always = 1

" Ale completion
" let g:ale_completion_enabled = 1

" help behaviour
" open help in new tab
" cabbrev help tab help
" cabbrev h tab h

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

" ++ scrooloose comments
" add spaces to nerd/sexy comments (Standard JS no-warn msg)
let NERDSpaceDelims=1

" buffer workflow - ',b to list buffers and prep :b'
nnoremap <Leader>b :ls<CR>:b<Space>
" instant markdown autostart
" let g:instant_markdown_autostart = 0

" ++ lightline directory path
" let g:lightline = {
      " \ 'active': {
      " \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      " \ }
      " \ }

" codi options
" codi on right
let g:codi#rightsplit = 0
" width on open
let g:codi#width = 70 
" default align left
let g:codi#rightalign = 0 

" going with hybrid numbers atm
set relativenumber
" set nu! rnu!

" test fzf completion
" inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" quick edit .vimrc <leader>vrc
nnoremap <silent> <Leader>vrc :tabnew<CR>:e ~/.vimrc<CR>
" quick edit notes <leader>vrc
nnoremap <silent> <Leader>note :tabnew<CR>:e ~/notes/88c8f4f99bb6bbd510ef1461ec06044f/notes.txt<CR>

" oo to insert new line below / no insert mode
nmap oo o<Esc>k
" OO to insert new line above / no insert mode
nmap OO O<Esc>j

" disable auto insert new comment line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" turn off YCM preview on top
set completeopt-=preview

" indent guides hide '$' at end of lines etc...
set listchars=""

" ycm color
highlight Pmenu ctermfg=Green ctermbg=Black
highlight PmenuSel ctermfg=Black ctermbg=Green

" ultisnips 
let g:UltiSnipsExpandTrigger="<c-e>"

" save code folding after closing / reopening files
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" macros in insert mode

" console.log()
inoremap CC <Esc>@c
" object
inoremap OO <Esc>@o
" array
inoremap AA <Esc>@a
" function
inoremap FF <Esc>@f
" loop
inoremap LL <Esc>@l
" semicolon
inoremap SS <Esc>@s
" comma
inoremap MM <Esc>@m
" key / prop
inoremap KK <Esc>@k
