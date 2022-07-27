# ...
# GPG settings
export GPG_TTY=$(tty)
 
# Golang settings
export PATH=$PATH:/usr/local/go/bin
 
# Add alias
alias -g vim='nvim'
 
alias ga='git add'
alias gr='git restore'
alias grs='git restore --staged'
alias gss='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit'
alias gcm='git commit -m'
 
alias bathelp='bat -plhelp'
help() {
    "$@" --help 2>&1 | bathelp
}
 
# Docker completions
fpath=(~/.zsh/completion $fpath)
 
# Initialize completion engine (keep to end of file)
### bash
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
 
### zsh
autoload -Uz compinit && compinit -i
source /usr/share/nvm/init-nvm.sh
