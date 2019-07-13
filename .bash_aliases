## GENERAL

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

## GIT

# quick default add, commit, push
alias gitquick="git add . && git commit -m 'quick edit (via alias)' && git push"
# quick verbose add, commit, push
alias gitpush="git add . && git commit -v && git push"

## FREQUENT FILES

# quick edit .vimrc
alias ev="vim ~/.vimrc"
# quick edit .bashrc
alias ebc="vim ~/.bashrc"
# quick edit .bash_aliases
alias eba="vim ~/.bash_aliases"
# quick edit .tmux.conf
alias et="vim ~/.tmux.conf"
# quick edit notes.txt
alias en="vim ~/Projects/notes/notes.md"

## BASH / SHELL

# open tdd terminal window same directory
alias tdd="gnome-terminal --window-with-profile=tdd"
# launch custom tmux config (used with keyboard shortcut)
alias tmuxs="~/bin/open-tmux"

# copy dotfiles, got to dir (vcs), add, commit, push
alias dotsync="~/bin/sync-dot-files && cd /srv/www/html/dot-config && ~/bin/update-project-push"
