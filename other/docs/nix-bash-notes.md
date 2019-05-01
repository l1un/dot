###### defaults 

`bat` - color cat

https://github.com/sharkdp/bat

---

`fzf` - fuzzy - command line + vim

https://github.com/junegunn/fzf

---

`rg` - ripgrep - command line + vim

https://github.com/BurntSushi/ripgrep

---

`z` - tab autocompete db
```
# install (avoid *brew bs)

git clone https://github.com/rupa/z/ ~/tmp/z
chmod +x ~/tmp/z/z.sh
mv ~/tmp/z/z.sh /usr/local/bin/
mv ~/tmp/z/z.1 /usr/local/share/man/man1
rm -rf ~/tmp/z

# then add '. usr/local/bin/z.sh' to .bashrc

```
https://github.com/rupa/z

##### pipe jq through less

`curl -s https://api.github.com/users/octocat/repos | jq '.' | cat`

##### bash-shortcuts
- <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>e</kbd> - readline function `shell-expand-line` 

- `gnome-terminal` open new window in current dir https://askubuntu.com/questions/401009/command-to-open-new-terminal-window-from-the-current-terminal

#### deb, ubuntu, mint, parrot, etc.

###### system
---
##### open folder default + on usb (fix baobob / disk analyzer issue)

`xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search`

###### www, permissions, servers

##### wordpress ownership swap for file ownership / updates etc.
- to edit files: `sudo chown -R <username>:www-data <dir>/`
- to run dashboard: `sudo chown -R www-data:www-data <dir>/`

###### network tools 
---

ex. `wlp4s0`

- ifconfig
  - `sudo iftop -i <interface-name>`

- bmon
  - `bmon <interface-name>`

- slurm
  - `slurm -z -i <interface-name>`

###### shutter fix (Mint 18x at least)

- after installing shutter to use the editor:
  - `sudo apt-get install libgoo-canvas-perl gnome-web-photo`
