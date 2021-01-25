alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

alias lsl="ls -alt | less"
alias lla="find . -maxdepth 1 -printf '%p\t\n'"

alias ghpq='git add . && git commit -m "Quick Push (via alias)." && git push'
alias ghpv="git add . && git commit -v && git push"
alias ghd="git diff"
alias ghs="git status"
alias ghl="git log"
alias ghcl="git config -l"

alias evc='vim $HOME/.vimrc'
alias ecoc='vim $HOME/.config/nvim/coc-settings.json'
alias enc='vim $HOME/.config/nvim/init.vim'
alias evt='vim $HOME/.vim/colors/llun.vim'
alias ebc='vim $HOME/.bashrc'
alias eba='vim $HOME/.bash_aliases'
alias etc='vim $HOME/.tmux.conf'

# copy date to clipboard
alias cpd='date | xclip -selection c'
# alias asn='$HOME/bin/add-sound-item'
# copy file to clipboard without opening it.
alias cpf='xclip -sel c <' # type filename after.

# Example to to copy output from command.
# <command> | xclip -selection clipboard
# Example to to paste back into shell.
# xclip -o

alias vcl='vim CHANGELOG.md'
# copy intellij idea projects/packages
alias cpip='$HOME/bin/copy-idea-project'
# launch new custom tmux session
alias tns='$HOME/bin/tmux-new-session'
# rename current tmux window
alias trw='$HOME/bin/tmux-rename-window'
# sync dotfiles, echo
alias sdf='$HOME/bin/sync-dot-files \
                    && cd "$HOME"/Projects/dot && git status'
# sync shell scripts
alias sss='$HOME/bin/sync-shell-scripts \
                    && cd "$HOME"/Projects/sh && git status'
# surfraw duckduckgo helper
alias srddg="surfraw_ddg"
# ripgrep look for words in file names
alias rgf='rg --files | rg'
