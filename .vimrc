" vundle / plugins " TIP: vim +PluginInstall +qall

set nocompatible              " be iMproved, required
filetype off                  " required

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
" Plugin 'thaerkh/vim-indentguides'
" indent line
Plugin 'Yggdroot/indentLine'
" utltisnips 
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" call vundle
call vundle#end()            " required
filetype plugin indent on    " required

" _____________________________________________________________________________

" +++ vim built-in configs
" _____________________________________________________________________________

" colors / aesthetics / setup -------------------------------------------------

" welcome --> display path on new open
echo "\r"
echom "editing -->" @%  
echo "\r"

syntax on
colorscheme monokai

" search and see regEx matches while typing
set incsearch

" autostart Line Numbers
set number
filetype plugin on

" change line number color 
highlight LineNr ctermfg=grey 

" hybrid numbers  (set nu! rnu!)
set relativenumber
" trying this with hybrid numbers
set numberwidth=1

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

" save code folding after closing / reopening files
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" remapping etc. --------------------------------------------------------------

" change <leader> to ',' instead of '\'
let mapleader=","
"set timeout timeoutlen=1500 <-- try if too fast 

" break / enter
" new line below / cursor stays 
noremap <Enter> o<ESC>k

" oo to insert new line below / no insert mode
noremap oo o<Esc>k
" OO to insert new line above / no insert mode
noremap OO O<Esc>j

" disable auto insert new comment line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" map <c-u> in inset to upercase (nice for constants)
inoremap <c-u> <esc>viw~A

" select to begining of line
nnoremap H 0
vnoremap H 0
" select to end of line
nnoremap L $
vnoremap L $

" testing jk for <esc> why not 
inoremap jk <Esc>
" temp unmap escape (force jk use test ) <nop>
inoremap <Esc> <nop>

" buffer workflow - ',b to list buffers and prep :b'
nnoremap <Leader>B :ls<CR>:b<Space>
nnoremap <Leader>b :bn<CR>

" help behaviour
" open help in new tab
" cabbrev help tab help
" cabbrev h tab h

" ----------------------------------------------------------------------------
" macros / abbrevs in insert mode

" console.log()
inoremap CC <Esc>@c 
" function@
inoremap FF <Esc>@f 
" object
iabbrev OO let obj = {
" array
iabbrev AA let arr = [
" semicolon
iabbrev ;; <Esc>A; 
" comma
iabbrev ,, <Esc>A,
" key / prop
inoremap @@k <Esc>@k

" ----------------------------------------------------------------------------
" quick edit/manage files

" quick edit .vimrc
nnoremap <silent> <Leader>ev :tabnew<CR>:e $MYVIMRC<CR>
" source vimrc 
nnoremap <silent> <Leader>so :so $MYVIMRC<CR>
" quick edit notes (vcs to gist)
nnoremap <silent> <Leader>en :tabnew<CR>:e ~/notes/88c8f4f99bb6bbd510ef1461ec06044f/notes.txt<CR>
" quick edit tmux
nnoremap <silent> <Leader>et :tabnew<CR>:e ~/.tmux.conf<CR>
" quick edit bash aliases
nnoremap <silent> <Leader>eba :tabnew<CR>:e ~/.bash_aliases<CR>
" quick edit bashrc
nnoremap <silent> <Leader>ebc :tabnew<CR>:e ~/.bashrc<CR>

" functions -------------------------------------------------------------------

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
noremap <leader>n :call RenameFile()<cr>


" _____________________________________________________________________________

" +++ vim plugin configs
" _____________________________________________________________________________

" Worp Ale ---------------------------------------------------------------------

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
let g:ale_sign_column_always = 0

" Ale completion
" let g:ale_completion_enabled = 1

" scrooloose comments ----------------------------------------------------------

" add spaces to nerd/sexy comments (Standard JS no-warn msg)
let NERDSpaceDelims=1

" instant markdown -------------------------------------------------------------

" instant markdown autostart
let g:instant_markdown_autostart = 0

" lightline --------------------------------------------------------------------

" ++ lightline directory path
" let g:lightline = {
      " \ 'active': {
      " \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      " \ }
      " \ }

" codi--------------------------------------------------------------------------

" codi options
" codi on right
let g:codi#rightsplit = 0
" width on open
let g:codi#width = 70 
" default align left
let g:codi#rightalign = 0 

" fzf --------------------------------------------------------------------------

" test fzf completion
" inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" YCM --------------------------------------------------------------------------

" turn off YCM preview on top
set completeopt-=preview

" ycm color
highlight Pmenu ctermfg=Green ctermbg=Black
highlight PmenuSel ctermfg=Black ctermbg=Green

" vim indent -------------------------------------------------------------------

" indent guides/lines hide '$' at end of lines etc...
set listchars=""
" let g:indentLine_setColors = 233 
let g:indentLine_color_term = 236 
" let g:indentLine_bgcolor_term = 235 
" let g:indentLine_char = '|'

" ultisnips --------------------------------------------------------------------

" set directory - TODO: add to dot files
let g:UltiSnipsSnippetDirectories = ['/home/o12/.vim/ultisnips']

" expand completion 
let g:UltiSnipsExpandTrigger="<c-e>"

" open :UltiSnipsEdit in split
let g:UltiSnipsEditSplit="vertical"

" _____________________________________________________________________________

" +++ vimscript / testing 
" _____________________________________________________________________________

" quick abbrev test
iabbrev <html> <html><cr><head><cr></head><cr><body><cr></body><cr></html>
