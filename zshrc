#!/usr/bin/zsh

# .zshrc

# External files
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

# Options
autoload -Uz colors && colors
bindkey -v

HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000

setopt share_history
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct

autoload -Uz compinit && compinit

# alias settings
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

# Load zplug
if [[ -f ${HOME}/.zplug/init.zsh ]]; then
  export ZPLUG_LOADFILE=${HOME}/.zplug.zsh
  source ~/.zplug/init.zsh

  # Auto installer
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  zplug load

else; printf "Install zplug? [y/N]: "
  if read -q; then
    curl -sL --proto-redir -all, https\
      https://raw.githubusercontent.com/zplug/installer/master/installer.zsh |
  zsh && source $0
  fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
