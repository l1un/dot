" Mapped BEFORE use, (Vimscript line by line)
let mapleader = ","
let maplocalleader = ",,"
"set timeout timeoutlen=1500 <-- try if too fast

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
highlight LineNr ctermfg=grey

" Full line highlight cursor
set cursorline

" Search Behaviour, RegEx Typing
set incsearch
set ignorecase

" Follow Working Directory
set autochdir

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

" Also reverse exlusive linewise behavior when wrap is on.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" New line above / cursor stays
noremap <Leader>O O<Esc>j
" New line below / cursor stays
noremap <Leader>o o<Esc>k
" New line above + below / cursor stays
noremap <Leader>= o<Esc>kO<Esc>j

" Move current line down
nnoremap <Leader>_ ddp:call Ek0("Moved Line Down")<CR>
" Move current line up
nnoremap <Leader>- dd<Esc>kkp<Esc>:call Ek0("Moved Line Up")<CR>

" Uppercase word, insert + normal / cursor stays
inoremap <C-u> <Esc>viw~ea
nnoremap <C-u> m`viw~<C-o>

" NOTE: Clipboard support required, X11, vim-gtk
" Copy selected test to system clipboard
vnoremap <Leader>y "+y:call Ek0('Copy to Clipboard')<CR>
" Paste system clipboard
nnoremap <Leader>p "+p:call Ek0('Paste from Clipboard')<CR>

" Paste Toggle, ouput state
nnoremap <Leader>pt :set paste!<CR>:set paste?<CR>

" Open current buffer in new tab (toggle larger view)
nnoremap <Leader>ts :tab split<CR>

" Trim whitespace at end of lines
nnoremap <Leader>tw :%s/\s\+$//e<CR>:call Ek0('Trim Whitespace')<CR>

" Cue to cut & paste text <cpt> to new file (enter <file-name-dir)
vnoremap <Leader>cpt :!cat >><Space>

" Search for visually highlighted text
vnoremap <Leader>st y<Esc>/<c-r>"<CR>:call Ek0('Select Search')<CR>
" Search for visually highlighted text + ready replace
vnoremap <Leader>sT y<Esc>/<c-r>"<CR>:%s///gc<Left><Left><Left>

" quickly turn off hls
nnoremap <Esc><Esc> :nohls<CR>:call Ek0(':nohls')<CR>

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

" <bf> - 'Browse Files'
nnoremap <silent><Leader>bf :Vexplore<CR>

" TODO: Filetype foldmethods
set foldmethod=manual

" Toggle Folds
nnoremap <Leader><space> za

" .vimrc
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
" .bash_aliases
nnoremap <silent> <Leader>eba :e<CR>:e ~/.bash_aliases<CR>
" .bashrc
nnoremap <silent> <Leader>ebc :e<CR>:e ~/.bashrc<CR>
" Source .vimrc
nnoremap <Leader>sv :so ~/.vimrc<CR>

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
function! Ek0(msg)
  echohl StatusLineTerm
  echo a:msg
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
