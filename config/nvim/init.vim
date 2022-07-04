" --------------------
" Neovim
" --------------------

let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

"source $CONFIG/dein/dein.rc.vim
source $CONFIG/nvim/rc.vim/vim-plug.rc.vim
source $CONFIG/nvim/rc.vim/options.rc.vim
source $CONFIG/nvim/rc.vim/keymap.rc.vim
source $CONFIG/nvim/rc.vim/autocmd.rc.vim
