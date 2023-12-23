git branch $args --format='%(refname:short)' | fzf -m --bind "ctrl-a:select-all" --bind "ctrl-d:deselect-all"
