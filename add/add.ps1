$files = $(git diff --name-only)
$untracked = $(git ls-files -o --exclude-standard)
$combined = $files + $untracked

$preview = 'echo -------- Diff ---------- & ' + `
    'git --no-pager diff --color=always {} & echo. & ' + `
    'echo -------- Content ------- & echo. & type {}'

$selected = $($combined.trim().replace(" ", "`n") `
    | fzf -m --ansi --bind "ctrl-a:select-all" `
        --bind "ctrl-d:deselect-all" `
        --preview $preview `
        --preview-window "right:65%")
    
if ($selected) {
    git add $selected
}
