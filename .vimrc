call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'lervag/vimtex'
Plug 'suan/vim-instant-markdown', { 'rtp': 'after' }
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tommcdo/vim-lion'
" DISABLED: plugins
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'godlygeek/tabular'
" Plug 'chrisbra/NrrwRgn'

call plug#end()

" START: startup, launch -------------------------------------------------

filetype plugin indent on

" map before use (vimscript line by line)
let mapleader = ','
let maplocalleader = ',,'

" required for parcel js bundler
set backupcopy=yes

" SETTINGS: global, set ---------------------------------------------------

" custom theme @ .vim/colors
syntax on
colorscheme llun

set encoding=utf-8
scriptencoding utf-8

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
set hlsearch
set incsearch
set ignorecase

" set statusline+=%#warningmsg#
" set statusline+=%*
" set laststatus=2
" set statusline=%f " tail of filename

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
nnoremap <Leader>!d o<Esc>:r!date \+\%Y\.\%m\.\%d\ \/\ \%R<CR>i### <Esc>o

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

augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

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

" .vimrc or init.vim (neovim)
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
" .vimrc (absolute for neovim)
nnoremap <silent> <Leader>eV :e ~/.vimrc<CR>
" theme
nnoremap <silent> <Leader>ec :e ~/.vim/colors/llun.vim<CR>
" notes (netrw)
nnoremap <silent> <Leader>en :e ~/Projects/notebook/main-note.md<CR>
" tmux
nnoremap <silent> <Leader>et :e<CR>:e ~/.tmux.conf<CR>
" ultisnips
" nnoremap <silent> <Leader>eu :UltiSnipsEdit<CR>

" source .vimrc
nnoremap <Leader>sv :source ~/.vimrc<CR>:redraw<CR>:nohls<CR>:call EchoCustom(':so[urce] .vimrc')<CR>

" clear view folder
nnoremap <Leader>cv :!rm ~/.vim/view/*

" FUNCTION: rename files --------------------------------------------------

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name !=? '' && new_name != old_name
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
    echo '[!]' a:msg
    echohl None
endfunction

" FUNCTION: REPL (math, etc.) ---------------------------------------------

function! Repl()
    while 1
        let expr = input ('>', '', 'expression')
        if expr ==? 'q' | break | endif
        if expr !=? ''
            echo "\n"
            if expr =~? '='
                execute 'let ' . expr
            else
                let ans = eval(expr)
                echo string(ans)
            endif
        endif
    endwhile
endfunction

nnoremap <Leader>rR :call Repl()<CR>

" FUNCTION: hide status / commmands ---------------------------------------

let s:hidden_all = 0

function! ToggleHiddenAll()
    if s:hidden_all == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        set cmdheight=1
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        set cmdheight=2
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

noremap <Leader>rN :call RunFileInNode()<CR>

" FUNCTION: run python, get comment ---------------------------------------

" run python in split
function! RunFileInPython()
    let python_file = expand('%')
    exec ':w !echo; python' python_file
endfunction

noremap <Leader>rP :call RunFileInPython()<CR>

" append python output as comment
function! GetPythonComment()
    exec ':r !python %'
    :execute "normal! i# \<Esc>"
endfunction

noremap <Leader>cP :call GetPythonComment()<CR>

" OS: gallium -------------------------------------------------------------

" DISABLED: set-keymap chromebook / gallium
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
    \          'vim': [ 'vint', 'ale_custom_linting_rules' ],
    \         'html': [ 'tidy', 'stylelint', 'alex' ],
    \     'markdown': [ 'remark-lint' ],
    \   'javascript': [ 'eslint', 'prettier', 'stylelint' ],
    \ }

" Ale fixing
let g:ale_fixers = { 'javascript': [ 'eslint' ], }

hi link ALEErrorSign    Error
hi link ALEWarningSign  Warning

" always show Ale gutter
let g:ale_sign_column_always = 0

" ale fix eslint
nmap <Leader>af <Plug>(ale_fix)
" read full error/warn message details
" nnoremap <silent> <Leader>ad :ALEDetail<CR>
nmap <Leader>ad <Plug>(ale_detail)

" let g:ale_sign_error = '--'
" let g:ale_sign_warning = '--'

" PLUGIN: lightline, buftabline -------------------------------------------

let g:lightline = {
    \   'colorscheme': 'simpleblack',
    \   'active': {
    \    'left': [ [ 'mode', 'paste' ],
    \              [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \   },
    \   'component_function': {
    \     'gitbranch': 'fugitive#head',
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

" DISABLED: realtime toggle - if taxing system
" let g:instant_markdown_slow = 1

" PLUGIN: nerd comments ---------------------------------------------------

" add spaces to nerd/sexy comments (Standard JS no-warn msg)
let NERDSpaceDelims=1

" PLUGIN: vimtex ----------------------------------------------------------

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" seperate build dir, NOTE: clean <LocalLeader>lc within vimtex obeys
" this setting when set here, unsure about .latexmkrc
let g:vimtex_compiler_latexmk = { 'build_dir': './build', }

let g:tex_conceal = '' " turn off internal LaTex syntax behaviour

" DISABLED: vimtex settings
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

" let g:fzf_layout = { 'down': '~18%' }

" remember: C-t, C-x, C-b == tab, split, vsplit
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>ft :BTags<CR>
nnoremap <Leader>fT :Tags<CR>

" PLUGIN: coc ------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" improves experience from default 4000
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

hi CocUnderline ctermfg=yellow

" Remap to jump to next diagnostic
nmap <silent> <Leader>cj <Plug>(coc-diagnostic-next)
" Remap for rename current word
nmap <Leader>cn <Plug>(coc-rename)
" autofix on current line
nmap <Leader>cf <Plug>(coc-fix-current)
" Show all diagnostics
nnoremap <silent> <Leader>cd :<C-u>CocList diagnostics<cr>
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" <cr> confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
augroup HighlightSymbol
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" DISABLED: settings for coc
" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)


" DISABLED: settings for ultisnips

" set directory
" let g:UltiSnipsSnippetDir = $HOME."/.vim/ultisnips"
" let g:UltiSnipsSnippetDirectories = [ '~/.vim/UltiSnips', 'UltiSnips' ]
" expand completion
" let g:UltiSnipsExpandTrigger='<c-j>'
" open :UltiSnipsEdit in split
" let g:UltiSnipsEditSplit='vertical'

" DISABLED: settings for ycm

" turn off ycm preview on top
" set completeopt-=preview

" get documentation word under cursor
" nnoremap <silent> <Leader>gd :YcmCompleter GetDoc <CR><C-w>w

" let g:ycm_python_binary_path='python'

" get full diagnostics (:lopen, :lclose, <leader>d)
" let g:ycm_always_populate_location_list = 1

" disable typescript server warnings
" let g:ycm_filter_diagnostics = { 'javascript': { 'regex': [ '.*' ] } }

" preview on bottom
" set splitbelow
" close preview after selecting
" let g:ycm_autoclose_preview_window_after_completion=1
" ycm colors
" highlight Pmenu ctermfg=Green ctermbg=Black
" highlight PmenuSel ctermfg=Black ctermbg=Green
