#!/usr/bin/fish

export SCRIPTS=$HOME/Projects/scripts-and-config/scripts

# Shortcuts
alias v="vim"
alias vi="vim"
alias vimrc="vi $HOME/.vimrc"
alias r="ranger"
alias gpg="gpg2"
alias mocp="mocp -T nightshade"
alias pip3="/usr/local/bin/pip3"
alias sudo="sudo "
alias su="echo kkk eae man"

alias ls="ls -N --color"
alias ll="ls -laho"
alias l="ls -l"

# Scripts
alias init-project="sh $SCRIPTS/init-project.sh"
alias download="sh $SCRIPTS/download.sh"
alias volume="sh $SCRIPTS/volume.sh"
alias dolar="python3 $SCRIPTS/dolar.py"
alias myip="python3 $SCRIPTS/ip.py"
alias kled="sh $SCRIPTS/change_led.sh"
alias yen="python3 $SCRIPTS/yen.py"
alias hkd="python3 $SCRIPTS/hkd.py"
alias cny="python3 $SCRIPTS/cny.py"
alias currencies="dolar ;and yen ;and hkd ;and cny"

# ENV variables
export PROJECTS=$HOME/Projects
export EDITOR=emacs
export GIT_EDITOR=vim
export TERM=st

function fish_prompt
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
    set_color green
    echo -n "λ "
    set_color yellow
    echo -n (whoami) " "
    set_color purple
    echo -n "["(prompt_pwd)"] "
    set_color blue
    echo -n '{'"$git_branch"'}'
    set_color cyan
    echo -n " → "
end

set BASE16_SHELL $HOME/.config/base16-shell/
[ -n "$PS1" ] ;and [ -s $BASE16_SHELL/profile_helper.sh ] ;and eval "($BASE16_SHELL/profile_helper.sh)"

bash $BASE16_SHELL/scripts/base16-tomorrow-night.sh
