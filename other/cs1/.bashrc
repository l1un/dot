# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# vim default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# vi bash mode
set -o vi

# up 1 dir
alias ..="cd ../"
# up 2 dirs
alias ...="cd ../../"
# up 3 dirs
alias ....="cd ../../../"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# aliases
alias submitted='cd /home/fac/ohsh/submit/20rq5001'

# quick edit .vimrc
alias evc='vim $HOME/.vimrc'
# quick edit vim theme
alias evt='vim $HOME/.vim/colors/llun.vim'
# quick edit .bashrc
alias ebc='vim $HOME/.bashrc'
# quick edit .bash_aliases
alias eba='vim $HOME/.bash_aliases'

# z - Jump Around!
. ~/bin/z.sh
