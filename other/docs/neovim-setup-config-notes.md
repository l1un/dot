# Setup

## Diagnostics

- `CocInstall coc-diagnostic`
- `npm -g install diagnostic-languageserver`

## Lint

- markdown: `CocInstall coc-markdownlint`
- html: `CocInstall coc-html` + `apt install tidy`
- js: `CocInstall coc-tsserver` + `npm insall -g eslint`
- json: `CocInstall coc-json`
- sh: `apt install shellcheck`
- tex: `CocInstall coc-texlab` + `CocInstall coc-vimtex` + `apt install chktex`
- vim: `apt install python3-pip` +  `pip3 install vim-vint`
