#
# ~/.bashrc
#

# export
export npm_config_prefix=~/.npm
export PATH="$HOME/.npm/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export JAVA_HOME=/usr/lib/jvm/default
export PATH=/usr/local/shell:$PATH
export PATH=$JAVA_HOME/bin:$PATH

export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"

# __LESS ENVPATH__
export LESS='-MigrWx4'

export PAGER='less'
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

# alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cl='clear'
alias ls='ls --color=auto'
alias la='ls -la --color=auto'
alias grep='grep --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

PS1='[\u@\W]\$ '

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
