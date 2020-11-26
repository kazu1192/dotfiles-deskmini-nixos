" Neovim

" source ~/.config/nvim/dein/dein.vim
source ~/.config/nvim/vim-plug/plug.vim
source ~/.config/nvim/cmd.vim
source ~/.config/nvim/map.vim

" view
set number
set relativenumber
set cursorline
set nowrap

" inputs
set clipboard^=unnamedplus
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac
set ambiwidth=double

" tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent

" search
set ignorecase
set smartcase

" others
set sh=bash
set scrolloff=5
set showmatch
set noswapfile
set laststatus=2
set noshowmode

syntax enable
set background=dark
colorscheme iceberg
