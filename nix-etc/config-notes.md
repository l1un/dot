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
