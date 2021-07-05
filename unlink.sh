#!/bin/sh

# set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)

unlink ~/.bin
unlink ~/.config

unlink ~/.bashrc
unlink ~/.bash_profile

unlink ~/.zshrc
unlink ~/.zplug.zsh

unlink ~/.vim
unlink ~/.vimrc

unlink ~/.tigrc

unlink ~/.gitconfig
unlink ~/.gitignore

unlink ~/.tmux.conf

unlink ~/.xinitrc

unlink ~/.npmrc
