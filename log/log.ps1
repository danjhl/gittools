param($n)
git log $n --pretty='format:%h %s' | fzf --ansi --preview='log_fzf_preview.bat {}' --preview-window "right:65%"
