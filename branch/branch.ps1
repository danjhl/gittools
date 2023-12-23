
# Options
$merge = "merge selected into current"
$rebase = "rebase current onto selected"

$a = "-r"
if ($args) {
    $a = $args
}

$br = $(git branch $a --format='%(refname:short)' | fzf)

if (!$br) {
    exit 1
}

$op = $("$merge`n$rebase" | fzf)

if ($op -eq $merge) {
    merge $br
} elseif ($op -eq $rebase) {
    rebase --onto $br $(git branch --show)
}
