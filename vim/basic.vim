" Forget compatibility with Vi. Who cares.  
set nocompatible 

" don't beep
set visualbell
set noerrorbells

" filetype mode on
" just in case we're not using vundle
filetype plugin indent on
syntax on

" hidden buffers on
set hidden

set wildignore+=*.pyc,*.egg-info,*.iml,*.o,*.obj,.git,*.class,.idea,.venv,.vfenv,*.swp,MANIFEST.in,*.egg,*.sublime-*,.DS_Store,*.tm_properties,node_modules
let NERDTreeIgnore=['\.pyc$', '\.egg-info$', '\.iml$', '\.o$', '\.obj$', '\.git$', '\.class$', '^\.idea$', '^\.vf?env$', '\.swp$', '^MANIFEST\.in$', '\.egg$', '\.sublime-', '^\.DS_Store$', '\.tm_properties$', '^node_modules$']

" ctags setup
" requires ctags to be installed from Homebrew
set tags=./.tags;/
command Mktags !ctags -R -f ./.tags .

" Wrap on words, not chars
" see http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set wrap
set linebreak
set nolist
" hard wrap at 80 chars by default
set textwidth=80
set wrapmargin=0
set display=lastline

" indentation with tabstops at 4
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showbreak=>>>>

set ruler
set relativenumber
setglobal relativenumber
set scrolloff=5
set colorcolumn=80
setglobal colorcolumn=80

if has("gui_running")
	" gui settings
	set guifont=Source_Code_Pro:h12
	" set guifont=Source_Code_Pro_for_Powerline:h12
	set lines=36 columns=120
	" remove scrollbars
	set guioptions-=L
	set guioptions-=r
end

" Make readonly buffers also non-modifiable
function UpdateModifiable()
  if !exists("b:setmodifiable")
    let b:setmodifiable = 0
  endif
  if &readonly
    if &modifiable
      setlocal nomodifiable
      let b:setmodifiable = 1
    endif
  else
    if b:setmodifiable
      setlocal modifiable
    endif
  endif
endfunction
autocmd BufReadPost * call UpdateModifiable()

" Auto write
set autowrite
autocmd FocusLost * silent! :wa
