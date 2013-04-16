let s:current_file=substitute(expand("<sfile>"), '[^/]*$', '', '')

exec ":source " . s:current_file . "/basic.vim"
exec ":source " . s:current_file . "/plugins.vim"
exec ":source " . s:current_file . "/keymaps.vim"

