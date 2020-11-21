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

# composer install on $HOME
EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php
echo $RESULT
