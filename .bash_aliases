# workflow
alias cHatter="/srv/www/html/chatter"
alias tEchdoc="/srv/www/html/tech-doc"
alias wEbpack="/srv/www/html/build-envs/webpack-template"
alias mOon="/srv/www/html/moondev9.github.io"
alias dAirc="/srv/www/html/derek-adaptable-info"

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
alias hTml="/srv/www/html/"
# ydk (localhost)
alias iDkjs="/srv/www/html/unary/idkjs"
# unary
alias uNary="/srv/www/html/unary"
# basic algs
alias bAlg="/srv/www/html/unary/fcc-map/algorithms-fcc/basic-algorithm-scripting"
# intermediate algs 
alias iAlg="/srv/www/html/unary/fcc-map/algorithms-fcc/intermediate-algorithm-scripting"
# advanced algs
alias aAlg="/srv/www/html/unary/fcc-map/algorithms-fcc/advanced-algorithm-scripting"
# dotfiles (vcs)
alias dOt="/srv/www/html/dot-config"

# cp dirs
# copy main dotfiles to VCS directory
alias cpdot="cp {.bash_aliases,.bashrc,.tern-config,.vimrc} /srv/www/html/dot-config/ && cp .config/terminator/config /srv/www/html/dot-config/.config/terminator/config"

# open new terminal windows in same directory
alias ++gnome="gnome-terminal"
alias ++dev="gnome-terminal --window-with-profile=dev"
alias ++tdd="gnome-terminal --window-with-profile=tdd"
