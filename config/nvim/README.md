# NeoVim Config

## Info

Neovim

<https://github.com/neovim/neovim>

dein.vim

<https://github.com/Shougo/dein.vim>

ファイル構成

```
.
├── cmd.vim   // autocmd設定
├── dein.toml // プラグイン指定
├── dein.vim  // dein.vim設定
├── init.vim  // main config
├── map.vim   // 独自コマンド設定
├── plugin    // プラグイン設定
│   └── *setting files*
├── README.md
└── VIM_CHEATSHEET.md // Vim操作書
```

`:checkhealth` で実行環境ヨシ

## Installed Plugins

Base plugins

- Shougo/dein.vim
- Shougo/vimproc.vim

LSP client

- neoclide/coc.nvim

Lint

- w0rp/ale

Completion

- cohama/lexima.vim

Syntax

- sheerun/vim-polyglot

fzf

- junegunn/fzf
- junegunn/fzf.vim

Status Line

- liuchengxu/eleline.vim

Run

- kassio/neoterm

Git

- airblade/vim-gitgutter
- tpope/vim-fugitive

Themes

- cocopon/iceberg.vim

## Tips

ale : Lintツール
<https://github.com/w0rp/ale>

- rubocop
- brakeman
- pug-lint
- prettier
- vint
- gitlint
- hadolint

coc.nvim : LSP対応補完ツール
<https://github.com/neoclide/coc.nvim>

- coc-highlight
- coc-yaml
- coc-vetur
- coc-tsserver
- coc-solargraph
- coc-phpls
- coc-json
- coc-java
- coc-html
- coc-css

[vim チートシート](VIM_CHEATSHEET.md)

...that's all
