let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

" ==================== Auto load for first time uses ====================
if empty(glob($HOME.'/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  exit 0
endif

" ======================== source settings files ========================
if !empty(glob($HOME.'/.local/share/nvim/site/autoload/plug.vim'))
  source $HOME/.config/nvim/_vim/vim-plug.vim
  if !empty(glob($DATA.'/plugged'))
    source $HOME/.config/nvim/_vim/plug.options.vim
  endif
endif

let splt = split(glob($HOME.'/.config/nvim/_vim/' . '*.vim'))
for file in splt
  execute 'source' file
endfor
