#!/bin/zsh

# add submodule
git submodule update --init --recursive
# prezto
setopt EXTENDED_GLOB
for rcfile in ${ZDOTDIR:-$HOME}/dotfiles/.zprezto/runcoms/^README.md(.N); do
 ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
# symlink dotfiles
ln -sf ~/dotfiles/.zprezto ~/.zprezto
ln -sf ~/dotfiles/.zpreztorc ~/.zpreztorc
