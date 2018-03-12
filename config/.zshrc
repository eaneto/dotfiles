# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH 
# Path to your oh-my-zsh installation.
export ZSH=/home/eldron/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="lambda-mod"
ZSH_THEME="lambda-mod"

# Set vim mode
bindkey -v

something() {
	    zle backward-word

}
zle -N something

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshconfig="vi ~/.zshrc"

alias airvok="cd ~/Projects/airvok/airvok && export FLASK_APP=airvok && flask run"
alias airvokdev="cd ~/Projects/airvok/airvok/ && vi resources/"
alias minify="python3 /home/eldron/Projects/airvok/minifier/minify.py"
alias redis="~/Projects/redis-4.0.7/src/redis-server"
alias postman="cd /home/eldron/Projects/Postman && ./Postman"

alias cotacao="cd ~/Projects/cotacao/ && python3 core.py"
alias myip="python3 /home/eldron/Projects/scripts/ip/ip.py"
alias multidoge="/usr/bin/java -jar /home/eldron/MultiDoge-0.1.7/multidoge-exe.jar"
alias rest="cd /home/eldron/Courses/Programming/Python/Flask/Python\ Flask\ REST\ API"

alias visualg="cd /home/eldron/.wine/dosdevices/c:/Program\ Files\ \(x86\)/Apoio/Visualg\ Versão\ 2 && wine visualg.exe"

alias v="vim"
alias vi="vim"
alias vimrc="vi ~/.vimrc"
alias r="ranger"
alias gpg="gpg2"
alias view="xviewer"
alias mocp="mocp -T nightshade"

alias ll="ls -laho"

# Scripts
alias brigthness="python3 ~/Projects/scripts/brigthness.py"
alias volume="python3 ~/Projects/scripts/volume.py"

# This export is used to work with vim lightline.
export TERM=xterm-256color

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"
