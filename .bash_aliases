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

# srv (localhost)
alias htm="/srv/www/html/"
# gatsby
alias gat="/srv/www/html/gatsby/"
# unary
alias una="/srv/www/html/unary"
# dotfiles (vcs)
alias dot="/srv/www/html/dot-config"

# cp dirs
# copy main dotfiles to vc directory
alias cpd="
cp {.bash_aliases,.bashrc,.vimrc,.tmux.conf} /srv/www/html/dot-config/ && \
cp .config/terminator/config /srv/www/html/dot-config/cat-spec/.config/terminator/config && \
cp .config/gtk-3.0/gtk.css /srv/www/html/dot-config/cat-spec/.config/gtk-3.0"

# open tdd terminal window same directory
alias tdd="gnome-terminal --window-with-profile=tdd"

# quick default add, commit, push 
alias gitq="git add . && git commit -m 'quick edit (via alias)' && git push"
# quick verbose add, commit, push 
alias gitp="git add . && git commit -v && git push"

# quick edit .vimrc
alias vrc="vim ~/.vimrc"
# quick edit .bashrc
alias brc="vim ~/.bashrc"
# quick edit .bash_aliases
alias bali="vim ~/.bash_aliases"
