##### dot-config 
`babel`
`bash`
`curl`
`eslint`
`gulp`
`json`
`vim`
`SSH`
`tern` 
`terminator`
`tmux`
`webpack`
`xkb`
`setxkbmap`

###### structure
```
.
├── .babelrc
├── bash
│   ├── .bash_aliases
│   ├── .bashrc
│   └── notes.md
├── .bash_aliases
├── .bashrc
├── CHANGELOG.md
├── .config
│   └── terminator
│       └── config
├── crontab
│   └── git-auto-push
├── .curlrc
├── .emacs
├── .eslintrc.js
├── gallium-os
│   ├── .bash_aliases
│   ├── .bashrc
│   ├── gallium-notes.md
│   ├── .vimrc
│   └── xkb
│       ├── chromebook_minimal
│       ├── chromebook_minimal_vim
│       ├── mykbd
│       ├── vimSwap
│       ├── .xkb
│       │   ├── keymap
│       │   │   └── mykbd
│       │   ├── recomp.sh
│       │   └── symbols
│       │       └── vimSwap
│       └── xkb-notes.md
├── .gemrc
├── git
│   └── template.txt
├── git.run
├── gulp
│   ├── latest-gulpfile.babel.js
│   └── old-test-gulpfile.js
├── misc-notes.txt
├── nix
│   ├── bash-etc
│   │   ├── redirect-pipe-sort-uniq.sh
│   │   ├── shell-scripts.md
│   │   └── shortcuts-bash.md
│   ├── config-notes.md
│   ├── curl-GET-jq-etc.md
│   └── test.txt
├── README.md
├── ssh
│   └── ssh-config-example
├── tdd-bdd
│   ├── jest.config.json
│   ├── mocha-standardJS-example-packagage.json
│   └── notes-unit-testing.md
├── .tern-config
├── .tern-project
├── .tmux.conf
├── vim
│   ├── plugins-vim
│   │   └── vim-jsx
│   │       └── xml.vim
│   ├── shortcuts-vim.md
│   └── vimium-notes-vim.md
├── .vimrc
└── webpack
    ├── webpack.common.js
    ├── webpack.dev.js
    └── webpack.prod.js

19 directories, 51 files
last generated: Wed Dec 26 15:54:10 PST 2018
```
###### packages
null
###### notes
null
###### changelog
`2018.12.27.1`
  - edit `.bashrc` (organize + remove unused)
  - update `.bash_aliases` with git commands


`2018.12.26.1`
  - add `.tmux.conf`
  - bash and terminator upates 
  - update this RM, tree, cl


`2018.12.14.1`
  - remove scripts from here (rethought)
  - terminator config
  - .bashrc $HOME addendum


`2018.12.14`
  - adjust terminator config again
  - add shell scripts (for replication and use)
  - add tree / notes sections
  - update this README / changelog

`2018.12.13`
- update and clean-up README

`2018.6.25`
- start switch from standard to jslint / prettier
- add .eslintrc.js

`2017.2.4`
- add / refine / improve gallium-notes
- add GalliumOS config notes and other updates
- other organization and refactoring

`2017.2.3`
- add GalliumOS updated .vimrc
- other minor tweaks
- create dir for unit tests, ssh, gulp + mv related files
- add GalliumOS keyboard mapping files for chromebooks (xkb)

*resources:*

- [Reddit: GalliumOS - "Help with keyboard mapping"](https://www.reddit.com/r/GalliumOS/comments/7fj1wl/help_with_keyboard_mapping/)
- [Stack Exchange: "Use setxkbmap to swap the Left Shift and Left Control"](https://unix.stackexchange.com/questions/65507/use-setxkbmap-to-swap-the-left-shift-and-left-control/65600)

`2017.12.1`
- changed <leader> in .vimrc
- updated README
- see commit -m's for prior minor updates

`2017.10.1`
- update .bash_aliases with cp-dot (refactor)
- added ssh-config-example
- update documentation

`2017.9.29`
- added new `cd` aliases to .bash_aliases
- added new `cp` file aliases to .bash_aliases
- added .bashrc to VCS

`2017.5.31`
- misc. 

`2017.5.18`
- vimrc: change noexpandtab to expandtab for standardjs and syntastic error checking compatibility

`2017.5.15`
- vimrc: remove old/unused lines from previous plugins / settings
- other misc.

`2017.5.13`
- vimrc: add syntastic, remove overflow hl, remove pathogen
- added standardjs and html tidy things

`2017.5.8`
- added gem and curl.
- testing text width and text width highlighting.

`2017-5-7`
- added vundle to .vimrc
- you complete me (YCM) / config via vundle
- added change log
