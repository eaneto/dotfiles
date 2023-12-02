function git_branch
    git branch | sed -n '/\* /s///p'
end

# ENV variables
export EDITOR=emacs
export GIT_EDITOR=vim
export PROJECTS=$HOME/projects
export SCRIPTS=$PROJECTS/snippets/shell

# Shortcuts
abbr v "vim"
abbr vi "vim"
abbr r "ranger"

abbr ls "ls -N --color"
abbr ll "ls -laho"
abbr l "ls -l"
abbr _ "sudo"


# Git shortcuts
abbr gst "git status"
abbr gd "git diff"
abbr gl "git pull"
abbr gp "git push"
abbr gpsup "git push --set-upstream origin $(git_branch)"
abbr gpf "git push --force"
abbr gco "git checkout"
abbr gcb "git checkout -b"
abbr gaa "git add --all"
abbr gc "git commit --verbose"
alias gc! "git commit --verbose --amend"

# Scripts
abbr volume "sh $SCRIPTS/volume.sh"

function fish_prompt
    set_color green
    echo -n "λ "
    set_color yellow
    echo -n (whoami) " "
    set_color purple
    echo -n "["(prompt_pwd)"] "
    set_color blue
    echo (fish_git_prompt)
    set_color cyan
    echo -n " → "
end
