function git_branch
    git branch | sed -n '/\* /s///p'
end

# ENV variables
export EDITOR=emacs
export GIT_EDITOR=vim
export PROJECTS=$HOME/projects
export SCRIPTS=$PROJECTS/snippets/shell

# Shortcuts
abbr r "ranger"
abbr gw "./gradlew"

abbr ls "ls -N --color"
abbr ll "ls -aho"
abbr l "ls -l"
abbr _ "sudo"

# Git shortcuts
abbr gst "git status"
abbr gd "git diff"
abbr gl "git pull"
abbr gf "git fetch"
abbr gp "git push"
abbr gpf "git push --force-with-lease"
abbr gco "git checkout"
abbr gcb "git checkout -b"
abbr ga "git add"
abbr gaa "git add --all"
abbr gc "git commit --verbose"
abbr gcl "git clone --recurse-submodules"
alias gc! "git commit --verbose --amend"

# Scripts
alias volume "sh $SCRIPTS/volume.sh"
alias swaudio "sh $SCRIPTS/swaudio.sh"

# GPG
export GPG_TTY=(tty)

function fish_prompt
    if test $status -eq 0
        set_color green
    else
        set_color red
    end
    echo -n "λ "
    set_color yellow
    echo -n (whoami) " "
    set_color purple
    echo -n "["(prompt_pwd)"] "
    if test -d .git
        set_color blue
        echo -n (fish_git_prompt)
    end
    set_color cyan
    echo -n " → "
end

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
