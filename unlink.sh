#!/bin/sh
# set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)

unlink $HOME/.bin
unlink $HOME/.config

unlink $HOME/.bashrc
unlink $HOME/.bash_profile

unlink $HOME/.zshrc
unlink $HOME/.zplug.zsh

unlink $HOME/.vim
unlink $HOME/.vimrc

unlink $HOME/.tigrc

unlink $HOME/.gitconfig
unlink $HOME/.gitignore

unlink $HOME/.tmux.conf

unlink $HOME/.xinitrc

unlink $HOME/.npmrc
