#          _              
#  _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|


export HOME=/home/eldron
export ZSH=/home/eldron/.oh-my-zsh

ZSH_THEME="lambda-mod"

something() {
	    zle backward-word
}

zle -N something

plugins=(git)

source $ZSH/oh-my-zsh.sh

export SCRIPTS=$HOME/Projects/scripts-and-config/scripts/

# Shortcuts
alias v="vim"
alias vi="vim"
alias vimrc="vi $HOME/.vimrc"
alias zshrc="vi $HOME/.zshrc"
alias r="ranger"
alias gpg="gpg2"
alias mocp="mocp -T nightshade"
alias pip3="/usr/local/bin/pip3"

alias ls="ls -N --color"
alias ll="ls -laho"

# Scripts
alias volume="sh $SCRIPTS/volume.sh"
alias myip="python3 $SCRIPTS/ip.py"
alias download="sh $SCRIPTS/download.sh"
alias kled="sh $SCRIPTS/change_led.sh"
alias dolar="python3 $SCRIPTS/dolar.py"
alias yen="python3 $SCRIPTS/yen.py"
alias init-project="sh $SCRIPTS/init-project.sh"

# ENV variables
export PROJECTS=$HOME/Projects
export EDITOR=emacs
export GIT_EDITOR=vim
export TERM=st

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

$BASE16_SHELL/scripts/base16-tomorrow-night.sh

case "$EMACS" in
    t)
    PROMPT_COMMAND=
    PS1="[\u@\h:\w]$ "
esac
