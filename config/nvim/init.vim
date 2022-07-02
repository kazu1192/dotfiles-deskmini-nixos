" --------------------
" Neovim
" --------------------

let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

"source $CONFIG/dein/dein.rc.vim
source $CONFIG/nvim/vim-plug.rc.vim
source $CONFIG/nvim/options.rc.vim
source $CONFIG/nvim/keymap.rc.vim
source $CONFIG/nvim/autocmd.rc.vim

" true color
if exists("&termguicolors") && exists("&winblend")
  runtime ./colors/iceberg.vim
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
endif
