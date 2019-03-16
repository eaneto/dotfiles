#          _              
#  _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|

export ZSH="/home/eldron/.oh-my-zsh"

ZSH_THEME="lambda-mod"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# ENV variables
export PROJECTS=$HOME/projects
export EDITOR=emacs
export GIT_EDITOR=vim
export SCRIPTS=$HOME/projects/scripts-and-config/scripts

# Shortcuts
alias v="vim"
alias vi="vim"
alias vimrc="vi $HOME/.vimrc"
alias zshrc="vi $HOME/.zshrc"
alias r="ranger"

alias ls="ls -N --color"
alias ll="ls -laho"

# Scripts
alias volume="sh $SCRIPTS/volume.sh"
alias myip="python3 $SCRIPTS/ip.py"
alias download="sh $SCRIPTS/download.sh"
alias dolar="python3 $SCRIPTS/dolar.py"
alias yen="python3 $SCRIPTS/yen.py"
alias hkd="python3 $SCRIPTS/hkd.py"
alias cny="python3 $SCRIPTS/cny.py"
alias currencies="dolar && yen && hkd && cny"
alias init-project="sh $SCRIPTS/init-project.sh"
alias pall="sh $SCRIPTS/pull_everything.sh"

case "$EMACS" in
    t)
    PROMPT_COMMAND=
    PS1="[\u@\h:\w]$ "
esac
