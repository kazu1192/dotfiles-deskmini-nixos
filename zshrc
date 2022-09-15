# .zshrc

# Load zplug
if [[ -f ${HOME}/.zplug/init.zsh ]]; then
  export ZPLUG_LOADFILE=${HOME}/.zplug.zsh
  source ~/.zplug/init.zsh

  zplug load
else; printf "Install zplug? [y/N]: "
  if read -q; then
    curl -sL --proto-redir -all, https\
      https://raw.githubusercontent.com/zplug/installer/master/installer.zsh |
  zsh && source $0
  fi
fi

# Options
autoload -Uz colors && colors
bindkey -v

# HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000

setopt share_history
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct

autoload -Uz compinit && compinit

# alias settings
alias la='ls -la'
alias x='exa'
alias xa='exa -a'
alias less='less -R'
alias diff='diff -U1'

# export
export npm_config_prefix=~/.npm
export PATH="$HOME/.npm/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# export JAVA_HOME=/usr/lib/jvm/default
# export PATH=$JAVA_HOME/bin:$PATH
export PATH=/usr/local/shell:$PATH

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Options to fzf command
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_COMPLETION_OPTS='--border --info=inline'
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# ghq show list for peco
function peco-src() {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
