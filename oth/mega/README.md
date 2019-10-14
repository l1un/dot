##### mega CLI

- Find version link: https://mega.nz/linux/MEGAsync/
- `wget https://mega.nz/linux/MEGAsync/<version>/Release.key`
- `sudo apt-key add Release.key`
- add line to repo in `/etc/apt/sources.list`:

  ```
    deb https://mega.co.nz/linux/MEGAsync/xUbuntu_16.04/ ./
  ```

- `sudo apt-get update`
- install the megatools `sudo apt-get install megatools`
- create `.megarc` for login:

  ```
    [Login]
    Username = email-address
    Password = password
  ```

- lock down permissions: `chmod 600 ~/.megarc`
- create remote root for sync: `megamkdir /Root/<backup-folder>`
- sync to remote: `megacopy --local $HOME/<folder-to-backup> --remote /Root/<backup-folder>`
