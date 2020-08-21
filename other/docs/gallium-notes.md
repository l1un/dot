# GalliumOS notes

## xkb keymapping for chromebooks

- 1. [see keyboard mapping articles](https://www.reddit.com/r/GalliumOS/comments/7fj1wl/help_with_keyboard_mapping/)
-- todo: add more details

- 1a. see .files and config content in xbd folder

- 1b. add keyboard mapping

- 1c. compile `xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY`

- 1d.  ADD DETAILS HERE optional script (in test) to check if `xinput list` has
changed, if true: recompile keyboard layout, sleep for 5 seconds, then check
again..

```Shell
#!/bin/bash
# Periodically check to see if an input device has beein plugged in or
# unplugged. If one has, recompile the keyboard layout.
# 2017-12-18
rate=5
oldlist=`xinput list`
while true
do
    newlist=`xinput list`
    # check if the previous list of input devices differs from the old one
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

## prereqs for config / .files

- 1. [install `nvm` + `node` + `npm`](https://www.nearform.com/blog/nodejs-sudo-free/)
-- allows npm global without sudo + nvm functionality:

- 2. check if node / npm is installed and what versions

```shell
which node
which npm
```

- b. if unable to install globally without sudo..

`sudo rm -rf /directory/of/node && /directory/of/npm`

- c. clean-up and remove related files

``` shell
sudo rm -f /usr/local/share/man/man1/node.1
sudo rm -f /usr/local/lib/dtrace/node.d
sudo rm -rf ~/.npm
sudo rm -rf ~/.node-gyp
```

- d. run each 'which' command a second time, if anything comes up, remove
those too.

- e. use script to install nvm
```curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash```

- f. install the latest stable release of nvm
`nvm install stable`

- g. set stable as default for new console windows
`nvm alias default stable`

- 3. [install `standard js`](https://github.com/standard/standard)
--global standard linting + vim `syntastic` support:
`npm install standard --global`

- 4. [install `vim-instant-markdown`](https://github.com/suan/vim-instant-markdown)
globally for markdown browser syncing: `npm -g install instant-markdown-d`

## browser extenstions / settings

a. Vimium - add rules for sites.

b. Stylebot - make sites (like Github) responsive --a must for viewing
repos, readmes, etc. in split windows..

```css
.blob-code-inner, .blob-num {
    font-size: 16px;
}

.columns {
    margin-left: 0;
    margin-right: 0;
}

.container {
    padding-left: 10px;
    padding-right: 10px;
    width: 100%;
}

.discussion-sidebar {
    width: 20%;
}

.discussion-timeline {
    width: 78%;
}

.header {
    min-width: 300px ;
}

.header-nav-link {
    -webkit-font-smoothing: antialiased;
}

.pinned-repo-item {
    width: 49%;
}

.repository-with-sidebar .repository-content {
    width: 92%;
}

.repository-with-sidebar .repository-sidebar {
    width: 6%;
}

.repository-with-sidebar.with-full-navigation .repository-content {
    width: 76%;
}

.repository-with-sidebar.with-full-navigation .repository-sidebar {
    width: 22%;
}

.vcard-avatar .avatar {
    height: auto;
    width: 100%;
}

body {
    min-width: 300px ;
}

```
