# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

# EXPORT
export npm_config_prefix=~/.npm
export PATH="$HOME/.npm/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# 4K display settings
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5

# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && echo "type startx!"
