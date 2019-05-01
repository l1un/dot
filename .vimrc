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
" Plugin 'suan/vim-instant-markdown'
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
" vim-json
Plugin 'elzr/vim-json'
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
" fugitive.vim
Plugin 'tpope/vim-fugitive'
" indent line
Plugin 'Yggdroot/indentLine'
" tmux vim split pane sync
Plugin 'christoomey/vim-tmux-navigator'
" python indent
Plugin 'vim-scripts/indentpython.vim'
" utltisnips
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'

" call vundle
call vundle#end()            " required
filetype plugin indent on    " required
" filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" global / file configs {

    set tabstop=2
    set softtabstop=2
    set shiftwidth=2

    " python at ~/.vim/ftplugin/python.vim
    " https://vim.fandom.com/wiki/Keep_your_vimrc_file_clean

" }

" colors, aesthetics, setup {

    " auto follow directory
    set autochdir

    " welcome --> display path on new open
    " echo '\r'
    " echom 'editing -->' @%
    " echo '\r'

    syntax on
    colorscheme monokai

    set encoding=utf-8

    " search and see regEx matches while typing
    set incsearch

    " ignoring case for now...
    set ignorecase

    " autostart Line Numbers
    set number
    " filetype plugin on

    " change line number color
    highlight LineNr ctermfg=grey

    " hybrid numbers  (set nu! rnu!)
    set relativenumber
    " trying this with hybrid numbers
    set numberwidth=1

    " width / wrap -fix html wrapping
    set tw=0
    set wrap
    set linebreak
    set nolist " list disables linebreak

    set statusline+=%#warningmsg#
    set statusline+=%*
    set laststatus=2
    set statusline=%f "tail of filename

    " test whitespace
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()


    " save code folding after closing / reopening files
    augroup savefolding
      autocmd!
      autocmd BufWinLeave *.* mkview
      autocmd BufWinEnter *.* silent loadview
    augroup END

    " netrw
    let g:netrw_banner = 0
    let g:netrw_liststyle = 3
    let g:netrw_browse_split = 4
    let g:netrw_altv = 1
    let g:netrw_winsize = 25
    " augroup ProjectDrawer
      " autocmd!
      " autocmd VimEnter * :Vexplore
    " augroup END

    " persistent undo config
    " set undofile
    " set undodir=~/.vim/undodir/

" }

" remapping etc. {

    " <leader> to ','
    let mapleader=","
    " <localleader> to ',,'
    let maplocalleader=",,"
    "set timeout timeoutlen=1500 <-- try if too fast

    " break / enter
    " new line below / cursor stays
    noremap <Enter> o<ESC>k

    " oo to insert new line below / no insert mode
    noremap oo o<Esc>k
    " OO to insert new line above / no insert mode
    noremap OO O<Esc>j

    " map <c-u> in insret to upercase (nice for constants)
    inoremap <c-u> <esc>viw~A

    " select to begining/end of lines
    nnoremap H 0
    vnoremap H 0
    nnoremap L $
    vnoremap L $

    " jk exit insert
    inoremap jk <Esc>
    " temp unmap escape
    inoremap <Esc> <nop>

    " ,B - list buffers and prep :b
    nnoremap <Leader>B :ls<CR>:b<Space>
    " ,b - buffer next
    nnoremap <Leader>b :bn<CR>

    " help behaviour
    " open help in new tab
    cabbrev help tab help
    cabbrev h tab h

    " goto EOL in insertmode
    inoremap AA <c-o>A

" }

" files {

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
    " open netrw
    nnoremap <silent> <Leader>dw :Vexplore<CR>
    " quick edit snippets
    " nnoremap <silent> <Leader>es :UltiSnipsEdit<CR>

" }

" functions {

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

    " run node in split
    function! RunFileInNode()
      let input_file = expand('%')
      exec ':set splitbelow | new | r! node' input_file
    endfunction

    " type <leader>r to run node file in split
    noremap <leader>r :call RunFileInNode()<cr>

" }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin config

" ale {

    "React  https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
    let g:jsx_ext_required = 0 " Allow JSX in normal JS files
    let g:ale_statusline_format = ['error', 'warning %d', '']
    let g:ale_linters = {
    \  'javascript': ['stylelint', 'eslint', 'prettier'],
    \  'css': ['stylelint', 'eslint'],
    \  'sh': ['language_server', 'shellcheck'],
    \}

    " Ale symbols
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '∆'

    " Ale fixing
    let g:ale_fixers = {
    \  'javascript': ['eslint'],
    \}

    " always show Ale gutter
    let g:ale_sign_column_always = 0

" }

" fzf {

    " test fzf completion
    " inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" }

" indent lines {

    " indent guides/lines hide '$' at end of lines etc...
    set listchars=""
    let g:indentLine_color_term = 236
    let g:vim_json_syntax_conceal = 0 " disable in JSON
    " let g:indentLine_setColors = 233
    " let g:indentLine_bgcolor_term = 235
    " let g:indentLine_char = '|'

" }

" instant markdown {

    " instant markdown autostart
    let g:instant_markdown_autostart = 0

" }

" lightline {

  " lightline relative paths (requires fugitive)
  let g:lightline = {
        \ 'component_function': {
        \   'filename': 'LightlineFilename',
        \ }
        \ }

  function! LightlineFilename()
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
      return path[len(root)+1:]
    endif
    return expand('%')
  endfunction

" }

" nerd comments {

    " add spaces to nerd/sexy comments (Standard JS no-warn msg)
    let NERDSpaceDelims=1

" }

" ultisnips {

    " set directory
    " let g:UltiSnipsSnippetDirectories = ['/home/o12/.vim/ultisnips']
    " expand completion
    " let g:UltiSnipsExpandTrigger="<c-e>"
    " open :UltiSnipsEdit in split
    " let g:UltiSnipsEditSplit="vertical"

" }

" you complete me (ycm) {

    " turn off ycm preview on top
    set completeopt-=preview
    " ycm colors
    highlight Pmenu ctermfg=Green ctermbg=Black
    highlight PmenuSel ctermfg=Black ctermbg=Green

    " let g:ycm_server_python_interpreter='/usr/bin/python'
    " let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
    let g:ycm_python_binary_path='python'
" }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: clean-up or integrate

" autocommand groups
" augroup testgroup
    " autocmd!
    " autocmd BufWrite * :echom 'foo'
    " autocmd BufWrite * :echom 'bar'
" augroup END

" comments test
" autocmd FileType javascript nnoremap <localleader>c I//<Space><esc>

" quick abbrev test
" iabbrev <html> <html><cr><head><cr></head><cr><body><cr></body><cr></html>

" <localleader>f - select in tags and fold
" augroup filetype_html
  " autocmd!
  " autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
" augroup END
