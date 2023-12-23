$branches = $(git branch -a --format='%(refname:short)')
$branches = $branches -replace "origin\/", ""
$selected = $branches | sort | get-unique | fzf

if ($selected) {
	git switch $selected
}
