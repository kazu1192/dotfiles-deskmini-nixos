" --------------------
" Neovim
" --------------------
" (respect craftzdog)

source ~/.vimrc

" true color
if exists("&termguicolors") && exists("&winblend")
  runtime ./colors/iceberg.vim
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
endif
