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

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


## GIT

# quick default add, commit, push
alias gitquick="git add . && git commit -m 'quick edit (via alias)' && git push"
# quick verbose add, commit, push
alias gitpush="git add . && git commit -v && git push"

## FREQUENT FILES

# quick edit .bashrc
alias ebc="vim ~/.bashrc"
# quick edit .bash_aliases
alias eba="vim ~/.bash_aliases"
