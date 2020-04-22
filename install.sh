#!/bin/sh -eu

#echo '* prezto install *'
#git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDOR:-$HOME}/.zprezto"
#mv -vf ~/.zprezto/runcoms ~/.zprezto/runcoms_back
#git clone https://github.com/kazu1192/prezto ~/.zprezto/runcoms
#setopt EXTENDED_GLOB
#for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#  ln -svf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#done

echo '* anyenv install *'
git clone https://github.com/anyenv/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zshrc
mkdir -p ~/.anyenv/plugins
git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update

~/.anyenv/bin/anyenv init
anyenv install --init

echo '* Starship install *'
curl -fsSlL https://starship.rs/install.sh | bash
