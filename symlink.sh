#!/bin/sh -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)

ln -snv $SCRIPT_DIR/bin ~/.bin
ln -snv $SCRIPT_DIR/config ~/.config

ln -snv $SCRIPT_DIR/bashrc ~/.bashrc
ln -snv $SCRIPT_DIR/bash_profile ~/.bash_profile

ln -snv $SCRIPT_DIR/zshrc ~/.zshrc
ln -snv $SCRIPT_DIR/zprofile ~/.zprofile

ln -snv $SCRIPT_DIR/vim ~/.vim
ln -snv $SCRIPT_DIR/vim/vimrc ~/.vimrc

ln -snv $SCRIPT_DIR/tigrc ~/.tigrc

ln -snv $SCRIPT_DIR/gitconfig ~/.gitconfig
ln -snv $SCRIPT_DIR/gittemplate ~/.gittemplate

ln -snv $SCRIPT_DIR/tmux.conf ~/.tmux.conf

ln -snv $SCRIPT_DIR/xinitrc ~/.xinitrc
