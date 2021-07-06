#!/bin/sh

# set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ -d $HOME/.config ]; then
  echo "move $HOME/.config directory"
  mv $HOME/.config ${SCRIPT_DIR}/.config_tmp
fi

ln -snv ${SCRIPT_DIR}/bin $HOME/.bin
ln -snv ${SCRIPT_DIR}/config $HOME/.config

ln -snv ${SCRIPT_DIR}/bashrc $HOME/.bashrc
ln -snv ${SCRIPT_DIR}/bash_profile $HOME/.bash_profile

ln -snv ${SCRIPT_DIR}/zshrc $HOME/.zshrc
ln -snv ${SCRIPT_DIR}/zplug.zsh $HOME/.zplug.zsh

ln -snv ${SCRIPT_DIR}/vim $HOME/.vim
ln -snv ${SCRIPT_DIR}/vimrc $HOME/.vimrc

ln -snv ${SCRIPT_DIR}/tigrc $HOME/.tigrc

ln -snv ${SCRIPT_DIR}/gitconfig $HOME/.gitconfig
ln -snv ${SCRIPT_DIR}/gitignore $HOME/.gitignore

ln -snv ${SCRIPT_DIR}/tmux.conf $HOME/.tmux.conf

ln -snv ${SCRIPT_DIR}/xinitrc $HOME/.xinitrc

ln -snv ${SCRIPT_DIR}/npmrc $HOME/.npmrc
