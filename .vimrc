" vundle / plugins -- vim +PluginInstall +qall

set nocompatible              " be iMproved, required
filetype off                  " required

" runtime path to include Vundle and init
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'itchyny/lightline.vim'
Plugin 'ap/vim-buftabline'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-vinegar'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'suan/vim-instant-markdown', { 'rtp': 'after' }
Plugin 'mattn/emmet-vim'
Plugin 'digitaltoad/vim-pug'

" RUNTIME: startup, launch ------------------------------------------------

" call vundle
call vundle#end()            " required
filetype plugin indent on    " required

" map before use (vimscript line by line)
let mapleader = ","
let maplocalleader = ",,"

" potential manual option for autoclosure
" source ~/.vim/config/autoclose.vim

" required for parcel js bundler
set backupcopy=yes

" SETTINGS: global, set ---------------------------------------------------

" custom molokai @ .vim/colors
syntax on
colorscheme molokai

set encoding=utf-8

" indent, tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" hybrid numbers, gutter
set number
set numberwidth=1
set relativenumber

" full line highlight cursor
set cursorline

" search, case, highlight
set hls
set incsearch
set ignorecase

" status, status line
set statusline+=%#warningmsg#
set statusline+=%*
set laststatus=2
set statusline=%f " tail of filename

" width, wrap
set tw=0
set wrap
set linebreak
set nolist " list disables linebreak

" scroll, scrolling, speed
set lazyredraw
set regexpengine=1

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
nnoremap <Leader>!d o<Esc>:r!date \+\%Y\-\%m\-\%d\ \/\ \%R<CR>i# <Esc>o

" show extraneous whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
"trim whitespace
nnoremap <Leader>tw :%s/\s\+$//e<CR>:call EchoCustom('Trimmed Whitespace')<CR>

" netrw config, project drawer, browse files
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 33

nnoremap <Silent><Leader>bf :Lexplore<CR>

" jump to EOL in insert
inoremap <C-a> <C-o>$

" FOLD: folding, settings, maps -------------------------------------------

set foldmethod=manual

" markdown folding options
" let g:markdown_folding = 1
" let g:markdown_enable_folding = 1

" FIXME: see below, causes issues with vundle E10: readonly ...
" persisant folds 2.0 - (mkview, loadview, do not remember syntax)
" stackexchange: vim-conceal-doesnt-work/19333#19333

" comment out group below before PluginInstall
augroup SaveFoldState
    autocmd!
    autocmd BufWinLeave ?* mkview | filetype detect
    autocmd BufWinEnter ?* silent loadview | filetype detect
augroup END

" show folded lines, first-line text, total lines folded
function! ShowFoldMessage()
    let count_lines = ' [' . (v:foldend - v:foldstart + 1) . '] '
    let raw_text = getline(v:foldstart)
    let fold_text = raw_text . ' ' . count_lines
    return fold_text
endfunction

" set folded text to function
set foldtext=ShowFoldMessage()

" FILE: edit, source, files, dirs -----------------------------------------

" .vimrc
nnoremap <Silent> <Leader>evc :e $MYVIMRC<CR>
" notes (netrw)
nnoremap <Silent> <Leader>en :e ~/Projects/notebook/main-note.md<CR>
" tmux
nnoremap <Silent> <Leader>etc :e<CR>:e ~/.tmux.conf<CR>
" .bash_aliases
nnoremap <Silent> <Leader>eba :e<CR>:e ~/.bash_aliases<CR>
" .bashrc
nnoremap <Silent> <Leader>ebc :e<CR>:e ~/.bashrc<CR>
" ultisnips
nnoremap <Silent> <Leader>eus :UltiSnipsEdit<CR>

" source .vimrc
nnoremap <Leader>sv :source ~/.vimrc<CR>:redraw<CR>:nohls<CR>:call EchoCustom('Reloaded .vimrc')<CR>

" clear view folder
nnoremap <Leader>cv :!rm ~/.vim/view/*

" FUNCTION: rename files --------------------------------------------------

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

noremap <Leader>n :call RenameFile()<CR>

" FUNCTION: echo color status ---------------------------------------------

" :so /usr/share/vim/vim81/syntax/hitest.vim
function! EchoCustom(msg)
    echohl WarningMsg
    echo "[!]" a:msg
    echohl None
endfunction

" FUNCTION: REPL (math, etc.) ---------------------------------------------

function! Repl()
    while 1
        let expr = input ('>', '', 'expression')
        if expr == 'q' | break | endif
        if expr != ''
            echo "\n"
            if expr =~ '='
                execute 'let ' . expr
            else
                let ans = eval(expr)
                echo string(ans)
            endif
        endif
    endwhile
endfunction

nnoremap <Leader>c :call Repl()<CR>

" FUNCTION: hide status / commmands ---------------------------------------

let s:hidden_all = 0

function! ToggleHiddenAll()
    if s:hidden_all == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        " set cmdheight=1
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        " set cmdheight=2
    endif
    call EchoCustom('ToggleHiddenAll')
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

" FUNCTION: run node.js ---------------------------------------------------

" runs in split, optionally use nodemon
function! RunFileInNode()
    let input_file = expand('%')
    exec ':w !echo; node' input_file
endfunction

noremap <Leader>rn :call RunFileInNode()<CR>

" FUNCTION: run python, get comment ---------------------------------------

" run python in split
function! RunFileInPython()
    let python_file = expand('%')
    exec ':w !echo; python' python_file
endfunction

noremap <Leader>rpy :call RunFileInPython()<CR>

" append python output as comment
function! GetPythonComment()
    exec ':r !python %'
    :execute "normal! i# \<Esc>"
endfunction

noremap <Leader>cpy :call GetPythonComment()<CR>

" OS: gallium -------------------------------------------------------------

" Needs to be repeated frequently until new fix.
" nnoremap <Leader>sk :!set-keymap

" PLUGIN: ale -------------------------------------------------------------

" allow jsx in js files
" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:jsx_ext_required = 0

let g:ale_statusline_format = [ 'error', 'warning %d', '' ]

let g:ale_linters = {
    \           'sh': [ 'language_server', 'shellcheck' ],
    \          'css': [ 'stylelint', 'eslint' ],
    \          'pug': [ 'puglint', 'eslint' ],
    \          'tex': [ 'chktex' ],
    \         'html': [ 'tidy', 'stylelint', 'alex' ],
    \     'markdown': [ 'remark-lint' ],
    \   'javascript': [ 'eslint', 'prettier', 'stylelint' ],
    \ }

" Ale symbols
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '∆'

" Ale fixing
let g:ale_fixers = {
    \   'javascript': [ 'eslint' ],
    \ }

" always show Ale gutter
let g:ale_sign_column_always = 0

" ale fix eslint
nnoremap <Silent> <Leader>af :ALEFix eslint<CR>
" read full error/warn message details
nnoremap <Silent> <Leader>ad :ALEDetail<CR>

" PLUGIN: lightline, buftabline -------------------------------------------

let g:lightline = {
  \   'colorscheme': 'simpleblack' ,
  \   'component': {
  \     'filename': '%f',
  \   },
  \ }

" tabline settings
set showtabline=2
" vim-bufftabline show numbers
let g:buftabline_numbers = 1
" let g:buftabline_separators = 1

" PLUGIN: instant markdown ------------------------------------------------

" autoscroll toggle
let g:instant_markdown_autoscroll = 1
" autostart toggle
let g:instant_markdown_autostart = 0
" realtime toggle - if taxing system
" let g:instant_markdown_slow = 1

" PLUGIN: nerd comments ---------------------------------------------------

" add spaces to nerd/sexy comments (Standard JS no-warn msg)
let NERDSpaceDelims=1

" PLUGIN: ultisnips -------------------------------------------------------

" set directory
" let g:UltiSnipsSnippetDir = $HOME."/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories = [ "~/.vim/UltiSnips", "UltiSnips" ]
" expand completion
let g:UltiSnipsExpandTrigger="<c-j>"
" open :UltiSnipsEdit in split
let g:UltiSnipsEditSplit="vertical"

" PLUGIN: you complete me, ycm --------------------------------------------

" ycm preview on bottom
" set splitbelow

" close preview after selecting
" let g:ycm_autoclose_preview_window_after_completion=1

" turn off ycm preview on top
set completeopt-=preview

" get documentation word under cursor
nnoremap <Silent> <Leader>gd :YcmCompleter GetDoc <CR><C-w>w

" ycm colors
" highlight Pmenu ctermfg=Green ctermbg=Black
" highlight PmenuSel ctermfg=Black ctermbg=Green

let g:ycm_python_binary_path='python'

" get full diagnostics (:lopen, :lclose, <leader>d)
let g:ycm_always_populate_location_list = 1

" disable typescript server warnings
let g:ycm_filter_diagnostics = { 'javascript': { 'regex': [ '.*' ] } }

" PLUGIN: vimtex ----------------------------------------------------------

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" seperate build dir, NOTE: clean <LocalLeader>lc within vimtex obeys
" this setting when set here, unsure about .latexmkrc
let g:vimtex_compiler_latexmk = { 'build_dir': './build', }

let g:tex_conceal = '' " turn off internal LaTex syntax behaviour
" set conceallevel=0
" let g:tex_conceal='abdmg'

" PLUGIN: emmet -----------------------------------------------------------

" leader .
let g:user_emmet_leader_key=','

" PLUGIN: vim-vinegar -----------------------------------------------------

" dot files hidden by default <gf> to show
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" closing netrw window / buffer
let g:netrw_fastbrowse = 0

" PLUGIN: fzf -------------------------------------------------------------

let g:fzf_layout = { 'up': '~15%' }
nnoremap <Leader>fz :FZF<CR>
