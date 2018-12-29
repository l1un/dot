# up 1 dir
alias ..="cd ../"
# up 2 dirs
alias ...="cd ../../"
# up 3 dirs
alias ....="cd ../../../"

# sets lsl to list all by time modified | less
alias lsl="ls -alt | less"
# list all files and directories ONLY
alias llA="find . -maxdepth 1 -printf '%p\t\n'"

# cd dirs 
# srv (localhost)
alias hTml="/srv/www/html/"
# gatsby
alias gAtsby="/srv/www/html/gatsby/"
# unary
alias uNary="/srv/www/html/unary"
# dotfiles (vcs)
alias dOtconfig="/srv/www/html/dot-config"

# cp dirs
# copy main dotfiles to VCS directory
alias cpdot="cp {.bash_aliases,.bashrc,.tern-config,.vimrc} /srv/www/html/dot-config/ && cp .config/terminator/config /srv/www/html/dot-config/.config/terminator/config"

# open new terminal windows in same directory
alias ++gnome="gnome-terminal"
alias ++dev="gnome-terminal --window-with-profile=dev"
alias ++tdd="gnome-terminal --window-with-profile=tdd"

# speed-up git workflow
alias gitQuick="git add . && git commit -m 'quick edit (via alias)' && git push"
alias gitPush="git add . && git commit -v && git push"
