##
# zshrc

# Options
autoload -Uz colors && colors
bindkey -v

setopt share_history
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# PATH Settings
export JAVA_HOME=/usr/lib/jvm/default
export PATH=/usr/local/shell:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$HOME/.anyenv/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# ALIAS Settings
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -lah'
alias x='exa'
alias xa='exa -a'
alias xl='exa -lh --git'
alias xla='exa -lah --git'
alias less='less -R'
alias grep='grep less'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='cd ../'
alias diff='diff -U1'

# autoload -Uz compinit && compinit

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
  print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
  print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
zinit-zsh/z-a-patch-dl \
zinit-zsh/z-a-as-monitor \
zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zplugin light "zsh-users/zsh-completions"
zplugin ice wait"!0" atload"_zsh_autosuggest_start"
zplugin light "zsh-users/zsh-autosuggestions"
zplugin light "mafredri/zsh-async"
# zplugin light "sindresorhus/pure"
zplugin ice wait"!0" atinit"zpcompinit; zpcdreplay"
zplugin ice wait'!0'; zplugin light "vintersnow/anyframe"
zplugin ice wait'!0'; zplugin light "b4b4r07/enhancd"
zplugin light "zsh-users/zsh-syntax-highlighting"

# zplugin end

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'

## neovim init and install
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"

eval "$(starship init zsh)"
