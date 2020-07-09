#!/bin/sh -eu
SCRIPT_DIR=$(cd $(dirname $0); pwd)

ln -svf $SCRIPT_DIR/.bin ~/.bin
ln -svf $SCRIPT_DIR/.config ~/.config

ln -svf $SCRIPT_DIR/.bashrc ~/.bashrc
ln -svf $SCRIPT_DIR/.bash_profile ~/.bash_profile

ln -svf $SCRIPT_DIR/.zshrc ~/.zshrc
ln -svf $SCRIPT_DIR/.zprofile ~/.zprofile

ln -svf $SCRIPT_DIR/.vim ~/.vim
ln -svf $SCRIPT_DIR/.vim/vimrc ~/.vimrc

ln -svf $SCRIPT_DIR/.tigrc ~/.tigrc

ln -svf $SCRIPT_DIR/.gitconfig ~/.gitconfig
ln -svf $SCRIPT_DIR/.gittemplate ~/.gittemplate

ln -svf $SCRIPT_DIR/.tmux.conf ~/.tmux.conf

ln -svf $SCRIPT_DIR/.xinitrc ~/.xinitrc
