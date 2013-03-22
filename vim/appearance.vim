colorscheme Tomorrow

set ruler
set number

if has("gui_running")
	" gui settings
	set guifont=Source_Code_Pro:h13
	set lines=30 columns=100
end

" Wrap on words, not chars
" see http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

" indentation with tabstops at 4
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set showbreak=>>>>
