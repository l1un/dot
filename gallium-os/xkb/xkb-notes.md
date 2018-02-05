##### ++ xkb-notes

- after adding files compile with:

`xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY`
- optional (to possibly add and test) script to check if `xinput list` has changed and recompiles:

```
#!/bin/bash
# Periodically check to see if an input device has beein plugged in or 
# unplugged. If one has, recompile the keyboard layout.
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
`
