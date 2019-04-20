# workflow
alias ..wIki="cd /var/www/html/unary/fcc-map/front-end-projects/wikipedia-viewer"
alias ..cHat="cd /var/www/html/chatter"
alias ..tEchd="cd /var/www/html/fcc-quick/fcc-tech-doc-page"
alias ..wEbpk="cd /var/www/html/build-envs/webpack-template"
alias ..mOon="cd /var/www/html/moondev9.github.io"

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
# html (localhost)
alias ..html="cd /var/www/html"
# ydk (localhost)
alias ..iDkjs="cd /var/www/html/unary/idkjs"
# pap
alias ..pap="cd /var/www/html/PAP/"
# p theme
alias ..pThm="cd /var/www/html/PAP/wp-content/themes/pap-child"
# unary
alias ..unary="cd /var/www/html/unary"
# basic algs
alias ..bAlg="cd /var/www/html/unary/fcc-map/algorithms-fcc/basic-algorithm-scripting"
# intermediate algs 
alias ..iAlg="cd /var/www/html/unary/fcc-map/algorithms-fcc/intermediate-algorithm-scripting"
# advanced algs
alias ..aAlg="cd /var/www/html/unary/fcc-map/algorithms-fcc/advanced-algorithm-scripting"
# dotfiles (vcs)
alias ..dOt="cd /var/www/html/dot-config"

# cp dirs
# copy main dotfiles to VCS directory
alias cpdot="cp {.bash_aliases,.bashrc,.vimrc,.config/terminator/config} /var/www/html/dot-config/"

# open new terminal windows in same directory
alias ++gnome="gnome-terminal"
alias ++dev="gnome-terminal --window-with-profile=dev"
alias ++blue="gnome-terminal --window-with-profile=blue"
alias ++red="gnome-terminal --window-with-profile=red"
alias ++white="gnome-terminal --window-with-profile=white"