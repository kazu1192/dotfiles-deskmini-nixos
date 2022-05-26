#!/usr/bin/zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "b4b4r07/enhancd", use:init.sh

zplug "clvv/fasd", as:command, use:fasd

# history search using ctrl+P/N
zplug "zsh-users/zsh-history-substring-search", defer:3
if zplug check "zsh-users/zsh-history-substring-search"; then
  bindkey '^P' history-substring-search-up
  bindkey '^N' history-substring-search-down
fi

# git
zplug "plugins/git", from:oh-my-zsh
zplug "peterhurford/git-aliases.zsh"

# syntax highlighting in shell command
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Auto completions
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions",\
    defer:2,\
    hook-load:'compdef _pacman powerpill=pacman',\
    hook-load:'compdef _apt apt-fast=apt'

zplug "mafredri/zsh-async",\
  from:github

zplug "sindresorhus/pure",\
  use:pure.zsh,\
  from:github,\
  as:theme
