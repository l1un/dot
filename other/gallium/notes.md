(3.0.2 beta) - Tue Jun 4 17:22:52 PDT 2019
-------------------------------------------

# Things to do on install: (TODO: refine / automate this)

  - adjust keyboard repeat etc. speed
  - setup window manager tile shortcuts
  - Copy dotfiles, .vimrc, .bashrc, terminator .conf, eslint, etc.
  - Disable tap to click (see below) script or startup
  - FIXME: (reverts) remap search / escape (see below) install script
  - Install terminator, htop, speedcrunch, LaTeX, py venv, linters
  - Install vim, compile firefox, (some available in new app grid)
  - Add nvim, node / npm latest
  - Add script for terminator config (avoid tmux atm here)
  - Add script to togle touchpad

# Disable tap to click or touchpad completely:

  - Find ID: `xinput --list`

  - Disable TTC: `xinput --set-int-prop <id> "Tap Enable" 8 0`
  - Renable TTC: `xinput --set-int-prop <id> "Tap Enable" 8 1`

  - Disable Touchpad: `xinput --set-prop <id> "Device Enabled" 0`
  - Renable Touchpad: `xinput --set-prop <id> "Device Enabled" 1`

```
case "$TERM" in
       xterm*) TERM-xterm-256color
esac

```

(Tested with 3.0.2 beta) - OLD
------------------------------

# Remap escape to search (xkb)

- add these files to `/usr/share/X11/xkb/symbols`:
  - chromebook_minimal
  - chromebook_minimal_vim
  - xkb_keymap

- copy .xkb directory to $HOME

- after adding files compile with:

`xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY`

- sorta works as crontab `@reboot sleep 30 && $HOME/bin/set-keymap`

# Script to try to periodically force check ^^ (untested)

```
  #!/bin/bash
  # Periodically check to see if an input device has beein plugged in
  # or unplugged. If one has, recompile the keyboard layout.
  # 2017-12-18

  rate=5
  oldlist=`xinput list`
  while true
  do
      newlist=`xinput list`
      # check if the previous list of input devices differs from the old
  one
      if diff <(echo "$oldlist") <(echo "$newlist") > /dev/null
      then
          true
          # echo Keyboard state hasn\'t changed. > /dev/null
      else
          echo It looks like something was plugged/unplugged.
          date
          # echo ~~~~ OLD INPUTS ~~~~
          # echo "$oldlist"
          # echo
          # echo ~~~~ NEW INPUTS ~~~~
          # echo "$newlist"
          # echo
          echo ~~~~ difference ~~~~
          echo '(old on left, new on right)'
          colordiff -y <(echo "$oldlist") <(echo "$newlist")
          echo
          echo running recompiler...
          . ~/.xkb/recomp.sh 2> /dev/null
          echo done.
      fi
      oldlist=$newlist
      sleep $rate
  done
  echo I shouldn\'t ever exit my loop... Something\'s wrong
  exit 1

```

(Possibly fixed with 3.0.2 beta) - OLD
---------------------------------------
- add to .bashrc to get 256 color in `xfce-terminal` for vim colorscheme to work etc.

https://bbs.archlinux.org/viewtopic.php?id=175581

https://stackoverflow.com/questions/19327836/why-am-i-seeing-only-8-colors-in-terminal-xfce-terminal


