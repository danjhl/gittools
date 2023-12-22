git reset HEAD $(git diff --name-only --cached | `
    fzf --bind "ctrl-a:select-all" --bind "ctrl-d:deselect-all" -m)
