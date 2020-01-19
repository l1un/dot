##### dot-config
`babel`
`bash`
`bin`
`curl`
`devilspie2`
`emacs`
`eslint`
`htop`
`gatsby`
`gnuplot`
`gulp`
`gtk`
`json`
`LaTeX`
`lynx`
`setxkbmap`
`speedcrunch`
`ssh`
`tern`
`terminator`
`tmux`
`tsserver`
`ultisnips`
`vim`
`vimium`
`webpack`
`xkb`
`zathura`

###### tree
```
.
├── .bash_aliases
├── .bashrc
├── bin
│   ├── add-changelog-entry
│   ├── add-npm-entry
│   ├── add-tree-entry
│   ├── change-bash-profile
│   ├── copy-shell-scripts
│   ├── get-window-info
│   ├── gzip_and_move
│   ├── open-tmux
│   ├── prep-audials-files
│   ├── print-colors
│   ├── save-last-command
│   ├── sync-dot-files
│   ├── sync-termux-dotfiles
│   ├── update-project-docs
│   ├── update-project-push
│   ├── update-readme-tree
│   └── z.sh
├── CHANGELOG.md
├── .config
│   ├── devilspie2
│   │   └── remove-window-decoration.lua
│   ├── gnuplot
│   │   └── qtterminal.conf
│   ├── gtk-3.0
│   │   └── gtk.css
│   ├── htop
│   │   └── htoprc
│   ├── SpeedCrunch
│   │   ├── session.json
│   │   └── SpeedCrunch.ini
│   ├── terminator
│   │   └── config
│   └── zathura
│       └── zathurarc
├── .emacs
├── etc
│   └── lynx
│       ├── lynx.cfg
│       └── lynx.lss
├── jsconfig.json
├── .latexmkrc
├── .lynxrc
├── oth
│   ├── .babelrc
│   ├── cat
│   ├── crontab
│   │   └── git-auto-push
│   ├── .curlrc
│   ├── docs
│   │   ├── gallium-notes.md
│   │   ├── git-template.txt
│   │   ├── nix-bash-notes.md
│   │   ├── npm-config-notes.md
│   │   └── old-tdd-notes.md
│   ├── .eslintrc.js
│   ├── gallium
│   │   ├── .bashrc
│   │   ├── bin
│   │   │   ├── disable-radios
│   │   │   ├── set-keymap
│   │   │   └── toggle-touchpad
│   │   ├── .latexmkrc
│   │   ├── notes.md
│   │   ├── .vimrc
│   │   └── xkb
│   │       ├── chromebook_minimal
│   │       ├── chromebook_minimal_vim
│   │       ├── mykbd
│   │       ├── vimSwap
│   │       ├── .xkb
│   │       │   ├── keymap
│   │       │   │   └── mykbd
│   │       │   ├── recomp.sh
│   │       │   └── symbols
│   │       │       └── vimSwap
│   │       └── xkb-notes.md
│   ├── gatsby
│   │   ├── .eslintrc.js
│   │   └── package.json
│   ├── gulp
│   │   └── gulpfile.babel.js
│   ├── lint
│   │   ├── dD_package.json
│   │   ├── .eslintrc.js
│   │   ├── README.md
│   │   └── .stylelintrc
│   ├── lynx
│   │   ├── bash_bookmarks.html
│   │   ├── lynx_bookmarks.html
│   │   ├── lynx.cfg
│   │   ├── lynx.lss
│   │   └── nix_bookmarks.html
│   ├── mega
│   │   ├── .megarc
│   │   └── README.md
│   ├── ssh
│   │   └── ssh-config-example
│   ├── tdd
│   │   └── mocha-standard-js-example-package.json
│   ├── termux
│   │   ├── .bash_aliases
│   │   ├── .bashrc
│   │   ├── .hushlogin
│   │   ├── README.md
│   │   ├── .termux
│   │   │   └── termux.properties
│   │   └── .vimrc
│   ├── .tern-config
│   ├── .tern-project
│   ├── tmux
│   │   ├── tmux-split-example
│   │   └── tmux-startup-example
│   ├── vim
│   │   └── plugins-vim
│   │       └── vim-jsx
│   │           └── xml.vim
│   ├── vimium-options.json
│   └── webpack
│       ├── webpack.common.js
│       ├── webpack.dev.js
│       └── webpack.prod.js
├── package.json
├── package-lock.json
├── README.md
├── .tern-config
├── .tmux.conf
├── .vim
│   ├── colors
│   │   ├── molokai.vim
│   │   ├── yang.vim
│   │   └── yin.vim
│   ├── config
│   │   └── autoclose.vim
│   ├── ftplugin
│   │   ├── css.vim
│   │   ├── html.vim
│   │   ├── javascript.vim
│   │   ├── markdown.vim
│   │   ├── python.vim
│   │   └── tex.vim
│   └── UltiSnips
│       ├── javascript.snippets
│       └── text.snippets
└── .vimrc

40 directories, 107 files
last generated: Sun Jan 19 10:56:31 PST 2020
```
###### packages
```
devDependencies

null

dependencies

{
  "archy": "@1.0.0",
  "bash-language-server": "@1.5.6",
  "chalk": "@2.4.1",
  "express-generator": "@4.16.1",
  "gatsby-cli": "@2.8.8",
  "gulp-util": "@3.0.8",
  "http-server": "@0.11.1",
  "instant-markdown-d": "@0.2.0-rc.1",
  "interpret": "@1.1.0",
  "liftoff": "@2.5.0",
  "live-server": "@1.2.1",
  "local-web-server": "@3.0.7",
  "markdownlint": "@0.13.0",
  "markdownlint-cli": "@0.15.0",
  "minimist": "@1.2.0",
  "nodemon": "@2.0.2",
  "npm": "@6.13.4",
  "npm-check": "@5.9.0",
  "parcel-bundler": "@1.12.4",
  "pretty-hrtime": "@1.0.3",
  "pug-lint": "@2.6.0",
  "remark-cli": "@6.0.1",
  "remark-lint": "@6.0.4",
  "semver": "@5.5.0",
  "serve": "@9.3.0",
  "supervisor": "@0.12.0",
  "surge": "@0.20.1",
  "tern": "@0.21.0",
  "tildify": "@1.2.0",
  "v8flags": "@3.1.1",
  "yarn": "@1.9.4"
}

auto-generated: Sun Jan 19 10:56:31 PST 2020
```
###### notes
###### [changelog](CHANGELOG.md)
