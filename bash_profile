# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

export TO_FISH_PATH=$PATH

exec fish
=======
export PATH="$HOME/.cargo/bin:$PATH"
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
