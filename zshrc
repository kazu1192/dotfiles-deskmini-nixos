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
  zinit-zsh/z-a-rust \
  zinit-zsh/z-a-as-monitor \
  zinit-zsh/z-a-patch-dl \
  zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# zinit plugins

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit load zdharma/history-search-multi-word

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin
zinit load agkozak/zsh-z
zinit wait lucid atload"zicompinit; zicdreplay" blockf for zsh-users/zsh-completions

# Load pure theme
zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
zinit light sindresorhus/pure

# other

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export settings
export JAVA_HOME=/usr/lib/jvm/default
export PATH=/usr/local/shell:$PATH
export PATH=$JAVA_HOME/bin:$PATH

export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
