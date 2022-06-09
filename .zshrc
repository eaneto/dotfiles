#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

export ZSH="/home/eaneto/.oh-my-zsh"

ZSH_THEME="lambda-mod"
ZSH_TMUX_AUTOSTART=true

plugins=(
    git
    git-prompt
    docker
    docker-compose
    virtualenv
    catimg
    ssh-agent
)

source $ZSH/oh-my-zsh.sh

# ENV variables
export PROJECTS=$HOME/projects
export EDITOR=emacs
export GIT_EDITOR=vim
export SCRIPTS=$PROJECTS/snippets/shell

# Shortcuts
alias v="vim"
alias vi="vim"
alias vimrc="vi $HOME/.vimrc"
alias zshrc="vi $HOME/.zshrc"
alias r="ranger"
alias gw="./gradlew"

alias ls="ls -N --color"
alias ll="ls -laho"

# Scripts
alias volume="sh $SCRIPTS/volume.sh"
alias download="sh $SCRIPTS/download.sh"
alias pall="sh $SCRIPTS/pull_everything.sh"

case "$EMACS" in
    t)
    PROMPT_COMMAND=
    PS1="[\u@\h:\w]$ "
esac

. ~/.profile

eval "$(jenv init -)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

setxkbmap us
