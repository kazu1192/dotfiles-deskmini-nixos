# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

export TO_FISH_PATH=$PATH
export PATH="$HOME/.cargo/bin:$PATH"

# 4K display settings
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5

# node setting
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules
export LANG=ja_JP.UTF-8

# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
echo "type startx!"
