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

# COPY FILES

# FIXME: create improved script / function with this + vc scripts
# variables to get / point
getvc="$HOME/.vimrc"
getbc="$HOME/.bashrc"
getba="$HOME/.bash_aliases"
gettm="$HOME/.tmux.conf"
gettermc="$HOME/.config/terminator/config"
getgtkcss="$HOME/.config/gtk-3.0/gtk.css"
getsnips="$HOME/.vim/ultisnips/*"
todotcon="/srv/www/html/dot-config"

# copy dotfiles to vc directory
# FIXME: Shellcheck: expands when defined, consider escaping
alias cpdotfiles="
cp $getvc $getbc $getba $gettm $gettermc $getgtkcss $getsnips $todotcon"
# copy shell scripts to vc directory with excludes
alias cpshellscripts="
rsync -av --exclude=searchai ~/bin/ /srv/www/html/shell-scripts/"

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
alias en="vim ~/notes/88c8f4f99bb6bbd510ef1461ec06044f/notes.txt"

## BASH / SHELL

# open tdd terminal window same directory
alias tdd="gnome-terminal --window-with-profile=tdd"
# launch custom tmux config (used with keyboard shortcut)
alias tmuxs="~/bin/tmuxopen"

## COMBO - FIXME: redo with script / function

# copy dotfiles, got to dir (vcs), add, commit, push
alias dotsync="cpdotfiles && cd /srv/www/html/dot-config && ~/bin/update-project-push"
