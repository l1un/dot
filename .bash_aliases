#######
# Temp
#######

# current workflow
alias ..wIki="cd /var/www/html/01110101-01101110-01100001-01110010-01111001/fCC-map/front-end-projects/wikipedia-viewer"

#########
# Aliases
#########

# Sets lsl to list all by time modified | less
alias lsl="ls -alt | less"

##########################
# Change directory aliases
##########################

# html (localhost) dir
alias ..hTml="cd /var/www/html"

# ydk (localhost) dir
alias ..yDk="cd /var/www/html/01110101-01101110-01100001-01110010-01111001/ydkjs"

# Desktop
alias ..Desk="cd ~/Desktop"

# Downloads
alias ..Loads="cd ~/Downloads"

# Documents
alias ..Ments="cd ~/Documents"

# pap dir
alias ..pAp="cd /var/www/html/pap/"

# unary  dir
alias ..uNary="cd /var/www/html/01110101-01101110-01100001-01110010-01111001"

# basic alg dir
alias ..bAlg="cd /var/www/html/01110101-01101110-01100001-01110010-01111001/fCC-map/basic-algorithm-scripting"

# intermediat alg dir
alias ..iAlg="cd /var/www/html/01110101-01101110-01100001-01110010-01111001/fCC-map/intermediate-agorithm-scripting"

# dotfiles dir (versioned)
alias ..dOt="cd /var/www/html/dotfiles"

# up 1 dir
alias ..="cd ../"
# up 2 dirs
alias ...="cd ../../"
# up 3 dirs
alias ....="cd ../../../"

##################
# Copy directories 
##################

# copy main dotfiles to VCS directory
alias cp-dot="cp {.bash_aliases,.bashrc,.vimrc} /var/www/html/dotfiles/"
