let s:current_file=substitute(expand("<sfile>"), '[^/]*$', '', '')

exec ":source " . s:current_file . "/basic.vim"
exec ":source " . s:current_file . "/vundle.vim"
exec ":source " . s:current_file . "/keymaps.vim"
exec ":source " . s:current_file . "/appearance.vim"
exec ":source " . s:current_file . "/misc.vim"

