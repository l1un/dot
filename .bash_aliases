## general --------------------------------------------------

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
alias gitquick="git add . && git commit -m 'quick edit (via alias)' && git push"
# quick verbose add, commit, push
alias gitpush="git add . && git commit -v && git push"

## quick edit config files -----------------------------------------------

# quick edit .vimrc
alias evrc='vim $HOME/.vimrc'
# quick edit vim theme
alias evth='vim $HOME/.vim/colors/molokai.vim'
# quick edit .bashrc
alias ebrc='vim $HOME/.bashrc'
# quick edit .bash_aliases
alias ebal='vim $HOME/.bash_aliases'
# quick edit .tmux.conf
alias etmc='vim $HOME/.tmux.conf'
# quick edit / cue notebook notes
alias enot='vim $HOME/Projects/notebook/main-note.md'

## bash / shell ------------------------------------------------------

# open tdd terminal window same directory
alias tdd="gnome-terminal --window-with-profile=tdd"
# launch custom tmux config (used with keyboard shortcut)
alias tmuxs='$HOME/bin/open-tmux'

# copy dotfiles, got to dir (vcs), add, commit, push
alias dotsync='$HOME/bin/sync-dot-files && cd "$HOME"/Projects/dot-config && $HOME/bin/update-project-push'

## surfraw

# duckduckgo helper
alias srddg="surfraw_ddg"
