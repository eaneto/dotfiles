function git_branch
    git branch | sed -n '/\* /s///p'
end

function gpsup
    git push --set-upstream origin $(git_branch)
end
