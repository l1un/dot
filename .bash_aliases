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

## git ------------------------------------------------------------------

# quick default add, commit, push
alias gitPushQuick="git add . && git commit -m 'Quick Push (via alias).' && git push"
# quick verbose add, commit, push
alias gitPushVerbose="git add . && git commit -v && git push"

## edit/modify config files --------------------------------------------

# quick edit .vimrc
alias evc='vim $HOME/.vimrc'
# quick edit nvim init.vim config file
alias enc='vim $HOME/.config/nvim/init.vim'
# quick edit vim theme
alias evt='vim $HOME/.vim/colors/llun.vim'
# quick edit .bashrc
alias ebc='vim $HOME/.bashrc'
# quick edit .bash_aliases
alias eba='vim $HOME/.bash_aliases'
# quick edit .tmux.conf
alias etc='vim $HOME/.tmux.conf'
# quick edit / cue notebook notes
alias emn='vim $HOME/Projects/notebook/main.md'
alias esn='vim $HOME/Projects/notebook/sound.md'

# quick add sound/audio entry to sound note
alias addSoundItem='$HOME/bin/add-sound-item'

## xclip ----------------------------------------------------------------

# copy file to clipboard without opening it.
alias cpFile='xclip -sel c <' # type filename after.

# NOTE: Create script to copy maybe paste shell output from commands...

# Example to to copy output from command.
# <command> | xclip -selection clipboard

# Example to to paste back into shell.
# xclip -o


## shell ----------------------------------------------------------------

# launch new custom tmux session
alias tns='$HOME/bin/tmux-new-session'
# rename current tmux window
alias trw='$HOME/bin/tmux-rename-window'

# copy dotfiles, echo message, TODO: fix/upate automation scripts.
alias syncDotFiles='$HOME/bin/sync-dot-files && cd "$HOME"/Projects/dot-config && git status'

## surfraw

# duckduckgo helper
alias srddg="surfraw_ddg"

# portable monitor setup
alias extdisp='sudo xrandr --newmode "1360x768_60.00"   84.75  1360 1432 1568 1776  768 771 781 798 -hsync +vsync
sudo xrandr --addmode DVI-I-1-1 "1360x768_60.00"
xrandr --output DVI-I-1-1 --mode "1360x768_60.00"'

## ripgrep

# look for words in file names
alias rgFile='rg --files | rg'
