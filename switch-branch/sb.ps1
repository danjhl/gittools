$branches = $(git branch -a --format='%(refname:short)')
$branches = $branches -replace "origin\/", ""
$selected = $branches | sort | get-unique | fzf

git switch $selected
