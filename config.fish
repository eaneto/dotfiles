#!/usr/bin/fish

# ENV variables
export PROJECTS=$HOME/projects
export EDITOR=emacs
export GIT_EDITOR=vim
export TERM=st
export SCRIPTS=$PROJECTS/snippets/shell/scripts

# Shortcuts
alias v="vim"
alias vi="vim"
alias vimrc="vi $HOME/.vimrc"
alias r="ranger"

alias ls="ls -N --color"
abbr ll "ls -laho"
abbr l "ls -l"
abbr sudo "sudo"

# Scripts
alias download="sh $SCRIPTS/download.sh"
alias volume="sh $SCRIPTS/volume.sh"
alias pall="sh $SCRIPTS/pull_everything.sh"

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
