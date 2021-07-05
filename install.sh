#!/bin/sh -eu

echo 'call unlink.sh * start *'
sh ${HOME}/.dotfiles/unlink.sh
echo 'call unlink.sh * success *'

echo 'call symlink.sh * start *'
sh ${HOME}/.dotfiles/symlink.sh
echo 'call symlink.sh * success *'
