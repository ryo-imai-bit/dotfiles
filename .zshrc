#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# Customize to your needs...
export PYENV_ROOT=/usr/local/var/pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# fzf
# noebrew
export PATH=$PATH:$HOME/.nodebrew/current/bin

if type "go" > /dev/null 2>&1; then
    # Go
    export PATH=$PATH:`go env GOPATH`/bin
fi
if type "opam" > /dev/null 2>&1; then
    # Ocaml
    eval `opam env`
fi
if [ -e ~/flutter/bin ]; then
    # Flutter
    export PATH="$PATH:$HOME/flutter/bin"
fi

# ghq cd project
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^]' ghq-fzf

# aliases
alias brewupdate="brew update && brew upgrade && brew cleanup"
alias g="git branch; git status"
# alias for composer
alias composer="php ~/composer.phar"

alias ide="~/.scripts/ide.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(/opt/homebrew/bin/brew shellenv)
