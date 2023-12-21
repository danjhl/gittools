$files = $(git diff --name-only)
$untracked = $(git ls-files -o --exclude-standard)
$combined = $files + " " + $untracked

$selected = $($combined.trim().replace(" ", "`n") `
    | fzf -m --ansi --bind "ctrl-a:select-all" `
        --bind "ctrl-d:deselect-all" `
        --preview 'git --no-pager diff --color=always & echo. & echo Full & echo. & type {}' `
        --preview-window "right:65%")
    
if ($selected -ne "") {
    git add $selected
}
