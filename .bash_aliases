# ----------------- gen ----------------------------------- 

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

# ----------------- dir ----------------------------------- 

# srv (localhost)
alias cdhtml="/srv/www/html/"
# gatsby
alias cdgats="/srv/www/html/gatsby/"
# unary
alias cdunar="/srv/www/html/unary"
# dot-config (vcs) 
alias cddotc="/srv/www/html/dot-config"

# ----------------- copy ----------------------------------- 

# copy dotfiles to vc directory
alias cpdotc="
cp {.bash_aliases,.bashrc,.vimrc,.tmux.conf} /srv/www/html/dot-config/ && cp .config/terminator/config /srv/www/html/dot-config/cat-spec/.config/terminator/config && cp .config/gtk-3.0/gtk.css /srv/www/html/dot-config/cat-spec/.config/gtk-3.0"

# ----------------- git ----------------------------------- 

# quick default add, commit, push 
alias gitquick="git add . && git commit -m 'quick edit (via alias)' && git push"
# quick verbose add, commit, push 
alias gitpush="git add . && git commit -v && git push"

# ----------------- configs -------------------------------- 

# quick edit .vimrc
alias vimrc="vim ~/.vimrc"
# quick edit .bashrc
alias bashrc="vim ~/.bashrc"
# quick edit .bash_aliases
alias bashal="vim ~/.bash_aliases"
# quick edit .tmux.conf
alias tmuxc="vim ~/.tmux-conf"

# ----------------- shell ---------------------------------- 

# open tdd terminal window same directory
alias tdd="gnome-terminal --window-with-profile=tdd"
# launch custom tmux config (used with keyboard shortcut)
alias tmuxs="~/bin/tmuxopen"

# ----------------- combo ---------------------------------- 

# copy dotfiles, got to dir (vcs), add, commit, push
alias pushdot="cpdotc && cddotc && gitpush"
