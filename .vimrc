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
" vim-javascript
Plugin 'pangloss/vim-javascript'
" vim-javascript-lib companion
Plugin 'crusoexia/vim-javascript-lib'
" Auto Pairs
Plugin 'jiangmiao/auto-pairs'
" vim-jsx
Plugin 'mxw/vim-jsx'
" vim-json
Plugin 'elzr/vim-json'
" lightline
Plugin 'itchyny/lightline.vim'
" vim-buftabline
Plugin 'ap/vim-buftabline'
" fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" surround.vim
Plugin 'tpope/vim-surround'
" repeat.vim
Plugin 'tpope/vim-repeat'
" vim-vinegar
Plugin 'tpope/vim-vinegar'
" tmux vim split pane sync
Plugin 'christoomey/vim-tmux-navigator'
" python indent
Plugin 'vim-scripts/indentpython.vim'
" LaTeX
Plugin 'lervag/vimtex'
" ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" vim-instant-markdown
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
" Emmet
Plugin 'mattn/emmet-vim'
" vim-pug
Plugin 'digitaltoad/vim-pug'

" startup, launch -----------------------------------------------
" call vundle
call vundle#end()            " required
filetype plugin indent on    " required

" Mapped BEFORE use, (vimscript line by line)
let mapleader = ","
let maplocalleader = ",,"
"set timeout timeoutlen=1500 <-- try if too fast

" Autoclose consider later...
" source ~/.vim/config/autoclose.vim

" for Parcel js bundler
set backupcopy=yes

" Note: Filetype Specific Reference
" python at ~/.vim/ftplugin/python.vim
" LaTeX at ~/.vim/ftplugin/tex.vim
" https://vim.fandom.com/wiki/Keep_your_vimrc_file_clean

" global, settings -----------------------------------------------
" Molokai added to .vim/colors
syntax on
" set termguicolors
colorscheme molokai

set encoding=utf-8

" Indentation, Tab behaviour
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Hybrid numbers, Gutter State fix, Grey Numbers
set number
set numberwidth=1
set relativenumber
" highlight LineNr ctermfg=grey

" Full line highlight cursor
set cursorline

" Search Behaviour, RegEx Typing
set incsearch
" set ignorecase

" follow Working Directory
" set autochdir

" Staus Line Settings
set statusline+=%#warningmsg#
set statusline+=%*
set laststatus=2
set statusline=%f "tail of filename

" Width, Wrap, TODO: HTML ftp, nolist debug
set tw=0
set wrap
set linebreak
set nolist " list disables linebreak

" FIXME: Speedup scrolling
set lazyredraw
set regexpengine=1

" go with this again
set hls

" set showtabline=2

" shortcuts, remap ----------------------------------------------
"  FIXME: remap help to open in new tab
" :cabbrev help tab help

" Also reverse exlusive linewise behavior when wrap is on.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Exit insert mode
" inoremap jk <Esc>
" Jump to EOL in insert
" inoremap <Esc> <nop>

" New line above / cursor stays
nnoremap <Leader>O O<Esc>j
" New line below / cursor stays
nnoremap <Leader>o o<Esc>k
" New line above + below / cursor stays
nnoremap <Leader>= o<Esc>kO<Esc>j

" Move current line down
nnoremap <Leader>_ ddp
" Move current line up
nnoremap <Leader>- dd<Esc>kkp<Esc>>

" Uppercase word, insert + normal / cursor stays
inoremap <C-u> <Esc>viw~ea
nnoremap <C-u> m`viw~<C-o>

" NOTE: Clipboard support required, X11, vim-gtk
" Copy selected test to system clipboard
vnoremap <Leader>y "+y:call EchoCustom('Selection Copied to System Clipboard')<CR>
" Paste system clipboard
nnoremap <Leader>p "+p:call EchoCustom('Pasted from System Clipboard')<CR>
" inoremap <Leader>p <C-o>"+p<C-o>:call Ek0('Paste from Clipboard')<CR>

" Paste Toggle, ouput state
nnoremap <Leader>pt :set paste!<CR>:set paste?<CR>

" List Buffers, buffer + Prep Entry
nnoremap <Leader>bl :ls<CR>:b<Space>
" Next Buffer
" nnoremap <Leader>bn :bn<CR>
" Previous Buffer
" nnoremap <Leader>bp :bp<CR>

" Open current buffer in new tab (toggle larger view)
nnoremap <Leader>ts :tab split<CR>

" Trim whitespace at end of lines
nnoremap <Leader>tw :%s/\s\+$//e<CR>:call EchoCustom('Trimmed Whitespace')<CR>

" Cue to cut & paste text <cpt> to new file (enter <file-name-dir)
vnoremap <Leader>cpt :!cat >><Space>

" Search for visually highlighted text
vnoremap <Leader>st y<Esc>/<c-r>"<CR>:call EchoCustom('Search for text...')<CR>
" Search for visually highlighted text + ready replace
vnoremap <Leader>sT y<Esc>/<c-r>"<CR>:%s///gc<Left><Left><Left>

" quickly turn off hls
nnoremap <Esc><Esc> :nohls<CR>:call EchoCustom(':nohls')<CR>

" Read, insert and format date (timestamp)
nnoremap <Leader>!d o<Esc>:r!date \+\%Y\-\%m\-\%d\ \/\ \%R<CR>i# <Esc>o

" Clear view folder
nnoremap <Leader>cv :!rm ~/.vim/view/*

" Show Extraneous Whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" NETRW File Browser Config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 33

" <bf> - 'Browse Files' split, rotate to below
" nnoremap <silent><Leader>bf :Sexplore<CR><c-W>r
" <bf> - 'Browse Files' left explore
nnoremap <silent><Leader>bf :Lexplore<CR>

" <C-a> jump to EOL in insert
inoremap <C-a> <C-o>$

" folding ----------------------------------------------------------
" TODO: Filetype foldmethods
set foldmethod=manual

" FIXME: testing
" let g:markdown_folding = 1
" let g:markdown_enable_folding = 1

" TODO: Look into: This causes issues with vundle E10: readonly ...
" Persisant Folds 2.0 - (mkview, loadview, do not remember syntax)
" SEE: stackexchange: vim-conceal-doesnt-work/19333#19333
" FIXME: Comment out group below before PluginInstall
augroup SaveFoldState
autocmd!
autocmd BufWinLeave ?* mkview | filetype detect
autocmd BufWinEnter ?* silent loadview | filetype detect
augroup END

" Show folded lines, first-line text, total lines folded
function! ShowFoldMessage()
let count_lines = ' [' . (v:foldend - v:foldstart + 1) . '] '
let raw_text = getline(v:foldstart)
" let fold_text = substitute(raw_text, '{{*', count_lines, 1)
let fold_text = raw_text . ' ' . count_lines
return fold_text
endfunction

" Set folded text to function
set foldtext=ShowFoldMessage()

" Toggle Folds
" nnoremap <Leader><space> za

" quick edit + source files ------------------------------------
" .vimrc
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
" notes (netrw)
nnoremap <silent> <Leader>en :e ~/Projects/notebook/main-note.md<CR>
" tmux
nnoremap <silent> <Leader>et :e<CR>:e ~/.tmux.conf<CR>
" .bash_aliases
nnoremap <silent> <Leader>eba :e<CR>:e ~/.bash_aliases<CR>
" .bashrc
nnoremap <silent> <Leader>ebc :e<CR>:e ~/.bashrc<CR>
" ultisnips
nnoremap <silent> <Leader>eus :UltiSnipsEdit<CR>

" Source .vimrc
nnoremap <Leader>sv :so ~/.vimrc<CR>:nohls<CR>

" custom functions ------------------------------------------------------
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
noremap <Leader>n :call RenameFile()<CR>

" echo color status message
" :so /usr/share/vim/vim81/syntax/hitest.vim
function! EchoCustom(msg)
echohl WarningMsg
echo "[!]" a:msg
echohl None
endfunction

" REPL (math, etc.)
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

" <leader> c to call REPL function
nnoremap <Leader>c :call Repl()<CR>

" javascript, node, js ---------------------------------------------
" run node in split
function! RunFileInNode()
let input_file = expand('%')
exec ':w !echo; node' input_file
endfunction

" type <leader>rn to run node file in split
noremap <leader>rn :call RunFileInNode()<cr>

" python -------------------------------------------------------
" run python in split
function! RunFileInPython()
let python_file = expand('%')
exec ':w !echo; python' python_file
endfunction

" type <Leader>rp to run python file in split
noremap <Leader>rp :call RunFileInPython()<cr>

" append python output as comment
function! GetPythonComment()
exec ':r !python %'
:execute "normal! i# \<Esc>"
endfunction

" type <Leader> to append output and comment
noremap <Leader>cpy :call GetPythonComment()<cr>

" gallium os --------------------------------------------------------
" Needs to be repeated frequently until new fix.
" nnoremap <Leader>sk :!set-keymap

" ale --------------------------------------------------------
" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" lacheck removed

let g:ale_statusline_format = ['error', 'warning %d', '']
let g:ale_linters = {
    \ 'javascript': [ 'eslint', 'prettier', 'stylelint'],
    \ 'css': ['stylelint', 'eslint'],
    \ 'sh': ['language_server', 'shellcheck'],
    \ 'markdown': ['remark-lint'],
    \ 'tex': ['chktex'],
    \ 'html': ['tidy', 'stylelint', 'alex'],
    \ 'pug': ['puglint', 'eslint'],
  \ }

" Ale symbols
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '∆'

" Ale fixing
let g:ale_fixers = {
    \ 'javascript': ['eslint'],
  \ }

" always show Ale gutter
let g:ale_sign_column_always = 0

" ale fix eslint
nnoremap <silent> <leader>af :ALEFix eslint<CR>
" read full error/warn message details
nnoremap <silent> <leader>ad :ALEDetail<CR>

" lightline, buftabline -----------------------------------
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

" instant markdown ---------------------------------------------
" autoscroll toggle
let g:instant_markdown_autoscroll = 1
" autostart toggle
let g:instant_markdown_autostart = 0
" realtime toggle - if taxing system
" let g:instant_markdown_slow = 1

" nerd comments -----------------------------------
" add spaces to nerd/sexy comments (Standard JS no-warn msg)
let NERDSpaceDelims=1

" ultisnips ---------------------------------------------------
" set directory
" let g:UltiSnipsSnippetDir = $HOME."/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories = ["~/.vim/UltiSnips", "UltiSnips"]
" expand completion
let g:UltiSnipsExpandTrigger="<c-j>"
" open :UltiSnipsEdit in split
let g:UltiSnipsEditSplit="vertical"

" you complete me, ycm --------------------------------------------
" ycm preview on bottom
" set splitbelow

" close preview after selecting
" let g:ycm_autoclose_preview_window_after_completion=1

" turn off ycm preview on top
set completeopt-=preview

" get documentation word under cursor
nnoremap <silent> <leader>gd :YcmCompleter GetDoc <CR><c-w>w

" ycm colors
" highlight Pmenu ctermfg=Green ctermbg=Black
" highlight PmenuSel ctermfg=Black ctermbg=Green

let g:ycm_python_binary_path='python'

" get full diagnostics (:lopen, :lclose, <leader>d)
let g:ycm_always_populate_location_list = 1

" disable typescript server warnings
let g:ycm_filter_diagnostics = { 'javascript': { 'regex': [ '.*' ] } }

" vimtex -------------------------------------------------------------------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" seperate build dir, NOTE: clean <LocalLeader>lc within vimtex obeys
" this setting when set here, unsure about .latexmkrc
let g:vimtex_compiler_latexmk = {
    \ 'build_dir': './build',
\ }

let g:tex_conceal = '' " turn off internal LaTex syntax behaviour
" set conceallevel=0
" let g:tex_conceal='abdmg'

" emmet --------------------------------------------------
" leader .
let g:user_emmet_leader_key=','

" vim-vinegar --------------------------------------------------
" dot files hidden by default <gf> to show
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" closing netrw window / buffer
let g:netrw_fastbrowse = 0

" fzf ---------------------------------------------------------
let g:fzf_layout = { 'up': '~15%' }
nnoremap <Leader>fz :FZF<CR>
