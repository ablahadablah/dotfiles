# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' '' '' 'r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/user/.zshrc'

autoload -U promptinit; promptinit
prompt spaceship

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

dl() {
    cd "$@" && ls;
}

alias gad="git add"
alias gadd="git add ."
alias gst="git status"
alias gcom="git commit"
alias gacom="git add . && git commit"
alias gcomam="git commit --amend"
alias gcd="git checkout"
alias gpull="git pull"
alias gpush="git push"
alias gpsf="git push --force-with-lease"
alias gf="git fetch"
alias gm="git merge --no-ff --no-commit"

alias clip="xclip -sel c <"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
