" colors
syntax on
colorscheme llun

" hybrid numbers, gutter
set number
set numberwidth=1
set relativenumber

" indent, tabs
set expandtab
set shiftwidth=3
set softtabstop=3
set tabstop=3

set textwidth=79
set colorcolumn=79

" full line highlight cursor
set cursorline

" search, case, highlight
set hlsearch
set incsearch
set ignorecase

let mapleader = ','
let maplocalleader = ',,'

" command line
set showmode
set ruler
set laststatus=2
" set showcmd
set cmdheight=2

" width, wrap
set textwidth=0
set wrap
set linebreak
set nolist " list disables linebreak

" scroll, scrolling, speed
" set lazyredraw
" set regexpengine=1

" MAP: shortcuts, remap ---------------------------------------------------

" reverse exlusive linewise behavior when wrap is on.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" new lines above, below, above and below, cursor static
nnoremap <Leader>O O<Esc>j
nnoremap <Leader>o o<Esc>k
nnoremap <Leader>= o<Esc>kO<Esc>j

" move current line up, down
nnoremap <Leader>- dd<Esc>kkp<Esc>>
nnoremap <Leader>_ ddp

" uppercase word, insert, normal, cursor stays
inoremap <C-u> <Esc>viw~ea
nnoremap <C-u> m`viw~<C-o>

" NOTE: clipboard support required, X11, vim-gtk
" copy, paste, to, from, system clipboard
vnoremap <Leader>y "+y:call EchoCustom('Copied to System Clipboard')<CR>
nnoremap <Leader>p "+p:call EchoCustom('Pasted from System Clipboard')<CR>

" paste toggle, output state
nnoremap <Leader>pt :set paste!<CR>:set paste?<CR>

" list buffers, buffer, prep entry
nnoremap <Leader>bl :ls<CR>:b<Space>

" search for visually highlighted text, same, then cue replace
vnoremap <Leader>st y<Esc>/<c-r>"<CR>:call EchoCustom('Search for text...')<CR>
vnoremap <Leader>sT y<Esc>/<c-r>"<CR>:%s///gc<Left><Left><Left>

" toggle hls constantly
nnoremap <Esc><Esc> :nohls<CR>:call EchoCustom(':nohls')<CR>

" read, insert and format date (timestamp)
nnoremap <Leader>!d :r!date \+\%Y\.\%m\.\%d\.\%R<CR>
inoremap !d <C-r>=strftime("\%Y\.\%m\.\%d\.\%R")<CR>

" show extraneous whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup ShowWhitespace
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
augroup end

"trim whitespace
nnoremap <Leader>tw :%s/\s\+$//e<CR>:call EchoCustom('Trimmed Whitespace')<CR>

" netrw config, project drawer, browse files
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 33

nnoremap <silent><Leader>bf :Lexplore<CR>

" jump to EOL in insert
inoremap <C-a> <C-o>$

" FOLD: folding, settings, maps ------------------------------------------

set foldmethod=manual
" DISABLED: Someday, some iteration of this might work right.
" augroup AutoSaveFolds
"   autocmd!
"   " view files are about 500 bytes
"   " bufleave but not bufwinleave captures closing 2nd tab
"   " nested is needed by bufwrite* (if triggered via other autocmd)
"   autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
"   autocmd BufWinEnter ?* silent! loadview
" augroup end

set viewoptions=folds,cursor
set sessionoptions=folds

" show folded lines, first-line text, total lines folded
function! ShowFoldMessage()
    let count_lines = ' (' . (v:foldend - v:foldstart + 1) . ')'
    let raw_text = getline(v:foldstart)
    let fold_text = raw_text . count_lines
    " let fold_text = count_lines . ' ' . raw_text
    return fold_text
endfunction

" set folded text to function
set foldtext=ShowFoldMessage()
" hide dashes on folded lines
set fillchars=fold:\

" DISABLED: markdown folding options
" let g:markdown_folding = 1
" let g:markdown_enable_folding = 1

" FILE: edit, source, files, dirs -----------------------------------------

" .vimrc (absolute for neovim)
nnoremap <silent> <Leader>evc :e ~/.vimrc<CR>

" FUNCTION: echo color status ---------------------------------------------

" :so /usr/share/vim/vim81/syntax/hitest.vim
function! EchoCustom(msg)
    echohl WarningMsg
    echo '[!]' a:msg
    echohl None
endfunction

