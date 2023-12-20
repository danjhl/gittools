# Options
$merge = "merge selected into current"
$rebase = "rebase current onto selected"

$br = $(git branch -r --format='%(refname:short)' | fzf)
$op = $("$merge`n$rebase" | fzf)

if ($op -eq $merge) {
    merge $br
} elseif ($op -eq $rebase) {
    rebase --onto $br $(git branch --show)
}
