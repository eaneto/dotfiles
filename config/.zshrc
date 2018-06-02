# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH 
# Path to your oh-my-zsh installation.
export HOME=/home/eldron
export ZSH=/home/eldron/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda-mod"

# Set vim mode
bindkey -v

something() {
	    zle backward-word
}

zle -N something

plugins=(git)

source $ZSH/oh-my-zsh.sh

SCRIPTS=$HOME/Projects/scripts-and-config/

alias airvok="cd $HOME/Projects/airvok ; export FLASK_APP=airvok ; export FLASK_ENV=development ; flask run"
alias redis="cd $HOME/Projects/airvok ; redis-server"
alias postman="cd $HOME/Projects/Postman && ./Postman"

alias exchange="python3 $HOME/Projects/cryptocurrencies-exchange/core.py"
alias myip="python3 $SCRIPTS/ip/ip.py"
alias download="cd $SCRIPTS && ./download.sh"

alias v="vim"
alias vi="vim"
alias vimrc="vi ~/.vimrc"
alias r="ranger"
alias gpg="gpg2"
alias mocp="mocp -T nightshade"
alias pip3="/usr/local/bin/pip3"

alias ls="ls -N --color"
alias ll="ls -laho"

# Scripts
alias brigthness="python3 $SCRIPTS/brigthness.py"
alias volume="python3 $SCRIPTS/volume.py"

export PROJECTS=$HOME/Projects
export EDITOR=emacs
export GIT_EDITOR=vim
export TERM=rxvt-unicode-256color

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

$BASE16_SHELL/scripts/base16-tomorrow-night.sh

case "$EMACS" in
    t)
    PROMPT_COMMAND=
    PS1="[\u@\h:\w]$ "
esac
