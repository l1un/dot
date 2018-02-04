# ++ GalliumOS - .bash_aliases - v0.1

# ++ temp workflow

# ++ commands
# up 1 dir
alias ..="cd ../"
# up 2 dirs
alias ...="cd ../../"
# up 3 dirs
alias ....="cd ../../../"

# ++ cd dirs 
# desktop
alias ..desk="cd ~/Desktop"
# downloads
alias ..down="cd ~/Downloads"
# documents
alias ..docs="cd ~/Documents"

# html (localhost)
alias ..html="cd /var/www/html"
# ydk (localhost)
alias ..ydk="cd /var/www/html/unary/ydkjs"
# unary
alias ..unary="cd /var/www/html/unary"
# basic algs
alias ..bAlg="cd /var/www/html/unary/fCC-map/basic-algorithm-scripting"
# intermediate algs 
alias ..iAlg="cd /var/www/html/unary/fCC-map/intermediate-algorithm-scripting"
# advanced algs
alias ..aAlg="cd /var/www/html/unary/fCC-map/advanced-algorithm-scripting"
# dotfiles (vcs)
alias ..dOt="cd ~/Documents/dotfiles/gallium-os"

# ++ cp dirs
# copy main dotfiles to VCS directory
alias cp-dot="cp {.bash_aliases,.bashrc} ~/Documents/dotfiles/gallium-os"
