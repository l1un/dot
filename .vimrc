" 0. Initialize, Plugins, Mappings -------------------------------- {{{
    " 0.1. Plugins, Init ------------------------------------------ {{{

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
        " fzf
        Plugin 'junegunn/fzf'
        Plugin 'junegunn/fzf.vim'
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
        " LaTeX
        Plugin 'lervag/vimtex'
        " utltisnips
        Plugin 'SirVer/ultisnips'
        Plugin 'honza/vim-snippets'
        " vim-instant-markdown
        Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
        " vim-markdown
        " Plugin 'godlygeek/tabular'
        " Plugin 'plasticboy/vim-markdown'

        " call vundle
        call vundle#end()            " required
        filetype plugin indent on    " required

    " }}}
    " 0.2. Leaders Mapping ---------------------------------------- {{{

        " Mapped BEFORE use, (Vimscript line by line)
        let mapleader = ","
        let maplocalleader = ",,"
        "set timeout timeoutlen=1500 <-- try if too fast

    " }}}
    " 0.3. Parcel Bundler ---------------------------------------- {{{

        set backupcopy=yes

    " }}}
" }}}
" 1. Global Built-In Settings + Config ---------------------------- {{{
    " 1.0. Notes -------------------------------------------------- {{{
        " Note: Filetype Specific Reference
        " python at ~/.vim/ftplugin/python.vim
        " LaTeX at ~/.vim/ftplugin/tex.vim
        " https://vim.fandom.com/wiki/Keep_your_vimrc_file_clean
    " }}}
    " 1.1. Settings ----------------------------------------------- {{{

        " Molokai added to .vim/colors
        syntax on
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
        highlight LineNr ctermfg=grey

        " Full line highlight cursor
        set cursorline

        " Search Behaviour, RegEx Typing
        set incsearch
        " set ignorecase

        " Follow Working Directory
        set autochdir

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
    " }}}
    " 1.2. Shortcuts, Remapping ----------------------------------- {{{

        " Also reverse exlusive linewise behavior when wrap is on.
        noremap j gj
        noremap k gk
        noremap gj j
        noremap gk k

        " Exit insert mode
        inoremap jk <Esc>
        " Jump to EOL in insert
        inoremap <Esc> <nop>
        " New line below / cursor stays
        " nnoremap <Enter> o<ESC>k

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

        " List Buffers + Prep Entry
        nnoremap <Leader>bl :ls<CR>:b<Space>
        " Next Buffer
        nnoremap <Leader>bn :bn<CR>
        " Previous Buffer
        nnoremap <Leader>bp :bp<CR>

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

    " }}}
    " 1.3. Whitespace Awareness ----------------------------------- {{{

        " Show Extraneous Whitespace
        highlight ExtraWhitespace ctermbg=red guibg=red
        match ExtraWhitespace /\s\+$/
        autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
        autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
        autocmd InsertLeave * match ExtraWhitespace /\s\+$/
        autocmd BufWinLeave * call clearmatches()

    " }}}
    " 1.4. NETRW file Browser Config ------------------------------ {{{

        " NETRW File Browser Config
        let g:netrw_banner = 0
        let g:netrw_liststyle = 3
        let g:netrw_browse_split = 4
        let g:netrw_altv = 1
        let g:netrw_winsize = 33

        " <bf> - 'Browse Files'
        nnoremap <silent><Leader>bf :Vexplore<CR>

    " }}}
    " 1.5. Global Folding Config ---------------------------------- {{{

        " TODO: Filetype foldmethods
        set foldmethod=manual

        " FIXME: testing
        " let g:markdown_folding = 1
        " let g:markdown_enable_folding = 1

        " TODO: Look into: This causes issues with vundle E10: readonly ...
        " Persisant Folds 2.0 - (mkview, loadview, do not remember syntax)
        " SEE: stackexchange: vim-conceal-doesnt-work/19333#19333
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
        nnoremap <Leader><space> za

    " }}}
" }}}
" 2. Quick Edit + Source Files ------------------------------------ {{{

    " .vimrc
    nnoremap <silent> <Leader>ev :sp $MYVIMRC<CR>
    nnoremap <silent> <Leader>eV :vsp $MYVIMRC<CR>
    " notes (netrw)
    nnoremap <silent> <Leader>en :sp ~/Projects/notebook/main-note.md<CR>
    " tmux
    nnoremap <silent> <Leader>et :tabnew<CR>:e ~/.tmux.conf<CR>
    " .bash_aliases
    nnoremap <silent> <Leader>eba :tabnew<CR>:e ~/.bash_aliases<CR>
    " .bashrc
    nnoremap <silent> <Leader>ebc :tabnew<CR>:e ~/.bashrc<CR>
    " ultisnips
    nnoremap <silent> <Leader>es :UltiSnipsEdit<CR>

    " Source .vimrc
    nnoremap <Leader>sv :so ~/.vimrc<CR>

" }}}
" 3. Custom Built-In Functions ------------------------------------ {{{
    " 3.1. Vim Functions ------------------------------------------ {{{

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
        noremap <leader>n :call RenameFile()<CR>

        " echo color status message
        " :so /usr/share/vim/vim81/syntax/hitest.vim
        function! Ek0(msg)
          echohl StatusLineTerm
          echo a:msg
          echohl None
        endfunction

    " }}}
    " 3.2. JS Functions ------------------------------------------- {{{

        " run node in split
        function! RunFileInNode()
          let input_file = expand('%')
          exec ':w !echo; node' input_file
        endfunction

        " type <leader>rn to run node file in split
        noremap <leader>rn :call RunFileInNode()<cr>

    " }}}
    " 3.3. PY Functions ------------------------------------------- {{{

        " run python in split
        function! RunFileInPython()
          let python_file = expand('%')
          exec ':w !echo; python' python_file
        endfunction

        " type <leader>rp to run python file in split
        noremap <leader>rp :call RunFileInPython()<cr>

        " append python output as comment
        function! GetPythonComment()
          exec ':r !python %'
          :execute "normal! i# \<Esc>"
        endfunction

        " type <localleader> to append output and comment
        noremap <leader>cpy :call GetPythonComment()<cr>

    " }}}
    " 3.4. GalliumOS functions ----------------------------------- {{{

        " Needs to be repeated frequently until new fix.
        " nnoremap <Leader>sk :!set-keymap

    " }}}
" }}}
" 4. Plugin Config ------------------------------------------------ {{{
    " 4.1. Ale ---------------------------------------------------- {{{

        " https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
        let g:jsx_ext_required = 0 " Allow JSX in normal JS files

        let g:ale_statusline_format = ['error', 'warning %d', '']
        let g:ale_linters = {
              \ 'javascript': ['stylelint', 'eslint', 'prettier'],
              \ 'css': ['stylelint', 'eslint'],
              \ 'sh': ['language_server', 'shellcheck'],
              \ 'markdown': ['remark-lint'],
              \ 'tex': ['lacheck', 'chktex'],
              \ 'html': ['tidy', 'stylelint', 'alex'],
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

    " }}}
    " 4.2. Fzf ---------------------------------------------------- {{{

        " test fzf completion
        " inoremap <expr> <c-x><c-k>
              " \ fzf#vim#complete('cat /usr/share/dict/words')

    " }}}
    " 4.3. Indent Lines ------------------------------------------- {{{

        " indent guides/lines hide '$' at end of lines etc...
        set listchars=""
        let g:indentLine_color_term = 236
        let g:vim_json_syntax_conceal = 0 " disable in JSON
        let g:indentLine_fileTypeExclude = ['markdown']

        " let g:indentLine_setColors = 233
        " let g:indentLine_bgcolor_term = 235
        " let g:indentLine_char = '|'

    " }}}
    " 4.4. Instant Markdown --------------------------------------- {{{

        " autoscroll toggle
          let g:instant_markdown_autoscroll = 1
        " autostart toggle
          let g:instant_markdown_autostart = 0
        " realtime toggle - if taxing system
          " let g:instant_markdown_slow = 1

    " }}}
    " 4.5. Lightline ---------------------------------------------- {{{

        " lightline relative paths (requires fugitive)
        let g:lightline = {
              \ 'component_function': {
              \   'filename': 'LightlineFilename',
              \   }
              \ }

        function! LightlineFilename()
          let root = fnamemodify(get(b:, 'git_dir'), ':h')
          let path = expand('%:p')
          if path[:len(root)-1] ==# root
            return path[len(root)+1:]
          endif
          return expand('%')
        endfunction

    " }}}
    " 4.6. Nerd Comments ------------------------------------------ {{{

        " add spaces to nerd/sexy comments (Standard JS no-warn msg)
        let NERDSpaceDelims=1

    " }}}
    " 4.7. Ultisnips ---------------------------------------------- {{{

        " set directory
        let g:UltiSnipsSnippetDirectories = ['$HOME/.vim/ultisnips']
        " expand completion
        let g:UltiSnipsExpandTrigger="Kj"
        " open :UltiSnipsEdit in split
        let g:UltiSnipsEditSplit="vertical"

    " }}}
    " 4.8. YCM - You Complete Me ---------------------------------- {{{

        " ycm preview on bottom
        " set splitbelow

        " close preview after selecting
        " let g:ycm_autoclose_preview_window_after_completion=1

        " turn off ycm preview on top
        set completeopt-=preview

        " get documentation word under cursor
        nnoremap <silent> <leader>yD :YcmCompleter GetDoc <CR><c-w>w

        " ycm colors
        highlight Pmenu ctermfg=Green ctermbg=Black
        highlight PmenuSel ctermfg=Black ctermbg=Green

        let g:ycm_python_binary_path='python'

        " get full diagnostics (:lopen, :lclose, <leader>d)
        let g:ycm_always_populate_location_list = 1

        " disable typescript server warnings
        let g:ycm_filter_diagnostics = { 'javascript': { 'regex': [ '.*' ] } }

    " }}}
    " 4.9. VimTeX ------------------------------------------------- {{{

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

    " }}}
" }}}
