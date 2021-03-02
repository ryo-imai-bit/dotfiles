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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# noebrew
export PATH=$PATH:$HOME/.nodebrew/current/bin
# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection


# aliases
alias brewupdate="brew update && brew upgrade && brew cleanup"
alias g="git branch; git status"
# alias for composer
alias composer="php ~/composer.phar"
# project paths
alias repo="cd ~/Documents/GitHub/"
alias goo="cd ~/Documents/GitHub/goo"
alias rank-king="cd ~/Documents/GitHub/rank-king"
alias credit="cd ~/Documents/GitHub/goo-child-credit"
alias excite="cd ~/Documents/GitHub/excite"

alias ide="~/.scripts/ide.sh"
