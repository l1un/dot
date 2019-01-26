# ----------------- gen ----------------------------------- 

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

# ----------------- dir ----------------------------------- 

# changed these as they work for cd and path
# srv (localhost)
alias html="/srv/www/html/"
# gatsby
alias gatsby="/srv/www/html/gatsby/"
# unary
alias unary="/srv/www/html/unary"
# dot-config (vcs) 
alias dotconfig="/srv/www/html/dot-config"
# modern js 
alias jstut="/srv/www/html/javascript-tutorial-en"

# ----------------- copy ----------------------------------- 
# TODO: create improved script / function with this + vc scripts
# variables to get / point
getvimrc="~/.vimrc"
getbashrc="~/.bashrc"
getbashal="~/.bash_aliases"
gettmuxc="~/.tmux.conf"
gettermc="~/.config/terminator/config"
getgtkcss="~/.config/gtk-3.0/gtk.css"
todotcon="/srv/www/html/dot-config"

# copy dotfiles to vc directory
alias cpdotfiles="
cp $getvimrc $getbashrc $getbashal $gettmuxc $gettermc $getgtkcss $todotcon"
# copy shell scripts to vc directory with excludes
alias cpshellscripts="
rsync -av --exclude=searchai ~/bin/ /srv/www/html/shell-scripts/"

# ----------------- git ----------------------------------- 

# quick default add, commit, push 
alias gitquick="git add . && git commit -m 'quick edit (via alias)' && git push"
# quick verbose add, commit, push 
alias gitpush="git add . && git commit -v && git push"

# ----------------- quick open common files -------------------------- 

# quick edit .vimrc
alias vrc="vim ~/.vimrc"
# quick edit .bashrc
alias brc="vim ~/.bashrc"
# quick edit .bash_aliases
alias bali="vim ~/.bash_aliases"
# quick edit .tmux.conf
alias tmxc="vim ~/.tmux.conf"
# quick edit notes.txt
alias note="vim ~/notes/88c8f4f99bb6bbd510ef1461ec06044f/notes.txt"

# ----------------- shell ---------------------------------- 

# open tdd terminal window same directory
alias tdd="gnome-terminal --window-with-profile=tdd"
# launch custom tmux config (used with keyboard shortcut)
alias tmuxs="~/bin/tmuxopen"

# ----------------- combo ---------------------------------- 

# copy dotfiles, got to dir (vcs), add, commit, push
alias updatedotfiles="cpdotfiles && dotconfig && ~/bin/update-project-push"
