set foldmethod=marker
setlocal spell spelllang=en_us

" TEST: vimtex clean on quit
augroup MyVimtex
	autocmd!
	autocmd User VimtexEventQuit call vimtex#latexmk#clean(0)
augroup END
