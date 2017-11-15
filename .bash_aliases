#########
# Aliases
#########

# Sets lsl to list all by time modified | less
alias lsl="ls -alt | less"

##########################
# Change directory aliases
##########################

# html (localhost) dir
alias cd-html="cd /var/www/html"

# pap dir
alias cd-pap="cd /var/www/html/pap/"

# journal dir
alias cd-journ="cd /var/www/html/01110101-01101110-01100001-01110010-01111001/p1xt/daily-journal"

# basic alg dir
alias cd-bAlg="cd /var/www/html/01110101-01101110-01100001-01110010-01111001/fCC-map/basic-algorithm-scripting"

# intermediat alg dir
alias cd-iAlg="cd /var/www/html/01110101-01101110-01100001-01110010-01111001/fCC-map/intermediate-agorithm-scripting"

# dotfiles dir (versioned)
alias cd-dot="cd /var/www/html/dotfiles"

##################
# Copy directories 
##################

# main dotfiles to VCS directory
alias cp-dot="cp {.bash_aliases,.bashrc,.vimrc} /var/www/html/dotfiles/"
