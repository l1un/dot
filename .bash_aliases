# workflow
alias ..cHat="cd /srv/www/html/chatter"
alias ..tEchd="cd /srv/www/html/tech-doc"
alias ..wEbpk="cd /srv/www/html/build-envs/webpack-template"
alias ..mOon="cd /srv/www/html/moondev9.github.io"
alias ..dAirc="cd /srv/www/html/derek-adaptable-info"

# commands
# up 1 dir
alias ..="cd ../"
# up 2 dirs
alias ...="cd ../../"
# up 3 dirs
alias ....="cd ../../../"

# sets lsl to list all by time modified | less
alias lsl="ls -alt | less"

# cd dirs 
# srv (localhost)
alias ..html="cd /srv/www/html/"
# ydk (localhost)
alias ..iDkjs="cd /srv/www/html/unary/idkjs"
# unary
alias ..unary="cd /srv/www/html/unary"
# basic algs
alias ..bAlg="cd /srv/www/html/unary/fcc-map/algorithms-fcc/basic-algorithm-scripting"
# intermediate algs 
alias ..iAlg="cd /srv/www/html/unary/fcc-map/algorithms-fcc/intermediate-algorithm-scripting"
# advanced algs
alias ..aAlg="cd /srv/www/html/unary/fcc-map/algorithms-fcc/advanced-algorithm-scripting"
# dotfiles (vcs)
alias ..dOt="cd /srv/www/html/dot-config"

# cp dirs
# copy main dotfiles to VCS directory
alias cpdot="cp {.bash_aliases,.bashrc,.tern-config,.vimrc} /srv/www/html/dot-config/ && cp .config/terminator/config /srv/www/html/dot-config/.config/terminator/config"

# open new terminal windows in same directory
alias ++gnome="gnome-terminal"
alias ++dev="gnome-terminal --window-with-profile=dev"
alias ++tdd="gnome-terminal --window-with-profile=tdd"
