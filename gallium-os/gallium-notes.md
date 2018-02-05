##### ++ gallium-notes

##### xkb keymapping for chromebooks

I. [see keyboard mapping
articles](https://www.reddit.com/r/GalliumOS/comments/7fj1wl/help_with_keyboard_mapping/) --commands details to be added

II. see .files and config content in xbd folder 

##### prereqs for config / .files:

I. [install `nvm` + `node` + `npm`](https://www.nearform.com/blog/nodejs-sudo-free/) -- allows npm global without sudo + nvm functionality:

a.  check if node / npm is installed and what versions
```
which node
which npm
```
b. if unable to install globally without sudo..

`sudo rm -rf /directory/of/node && /directory/of/npm`

c. clean-up and remove related files
```
sudo rm -f /usr/local/share/man/man1/node.1
sudo rm -f /usr/local/lib/dtrace/node.d
sudo rm -rf ~/.npm
sudo rm -rf ~/.node-gyp
```
d. run each 'which' command a second time, if anything comes up, remove
those too.

e. use script to install nvm
```curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash```

f. install the latest stable release of nvm
`nvm install stable`

g. set stable as default for new console windows
`nvm alias default stable`

II. [install `standard js`](https://github.com/standard/standard) --global standard linting + vim `syntastic` support: `npm install standard --global`

III. [install
  `vim-instant-markdown`](https://github.com/suan/vim-instant-markdown)
globally for markdown browser syncing: `npm -g install
instant-markdown-d` 

##### browser extenstions / settings
I. Vimium - add rules for sites.

II. Stylebot - make sites (like Github) responsive --a must for viewing
repos, readmes, etc. in split windows.. (css to be added)
