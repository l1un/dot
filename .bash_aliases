# up 1 dir
alias ..="cd ../"
# up 2 dirs
alias ...="cd ../../"
# up 3 dirs
alias ....="cd ../../../"
# sets lsl to list all by time modified | less
alias lsl="ls -alt | less"
# list all files and directories ONLY
alias lla="find . -maxdepth 1 -printf '%p\t\n'"

## git ----------------------------------------------------------

# quick default add, commit, push
alias gitpq="git add . && git commit -m 'quick edit (via alias)' && git push"
# quick verbose add, commit, push
alias gitpv="git add . && git commit -v && git push"

## quick edit config files -----------------------------------------------

# quick edit .vimrc
alias evc='vim $HOME/.vimrc'
# quick edit vim theme
alias evt='vim $HOME/.vim/colors/molokai.vim'
# quick edit .bashrc
alias ebc='vim $HOME/.bashrc'
# quick edit .bash_aliases
alias eba='vim $HOME/.bash_aliases'
# quick edit .tmux.conf
alias etc='vim $HOME/.tmux.conf'
# quick edit / cue notebook notes
alias en='vim $HOME/Projects/notebook/main-note.md'

## shell ----------------------------------------------------------------

# launch new custom tmux session
alias tns='$HOME/bin/tmux-new-session'
# rename current tmux window
alias trw='$HOME/bin/tmux-rename-window'

# copy dotfiles, got to dir (vcs), add, commit, push
alias dotsync='$HOME/bin/sync-dot-files && cd "$HOME"/Projects/dot-config && $HOME/bin/update-project-push && cd -'

## surfraw

# duckduckgo helper
alias srddg="surfraw_ddg"
