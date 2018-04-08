# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH 
# Path to your oh-my-zsh installation.
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

alias zshconfig="vi ~/.zshrc"

alias airvok="cd $HOME/Projects/airvok/airvok && export FLASK_APP=airvok && flask run"
alias airvokdev="cd $HOME/Projects/airvok/airvok/ && vi resources/"
alias postman="cd $HOME/Projects/Postman && ./Postman"

alias exchange="python3 $HOME/Projects/cryptocurrencies-exchange/core.py"
alias myip="python3 $SCRIPTS/ip/ip.py"
alias download="cd $SCRIPTS && ./download.sh"

alias v="vim"
alias vi="vim"
alias vimrc="vi ~/.vimrc"
alias r="ranger"
alias gpg="gpg2"

alias ll="ls -laho"

# Scripts
alias brigthness="python3 $SCRIPTS/brigthness.py"
alias volume="python3 $SCRIPTS/volume.py"

# This export is used to work with vim lightline.
export TERM=xterm-256color

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

$BASE16_SHELL/scripts/base16-tomorrow-night.sh
