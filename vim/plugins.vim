" Vundle setup
set shell=/bin/bash " makes vundle behave in macvim
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles to install
Bundle 'tpope/vim-surround'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'ciaranm/detectindent'
" Navigation
Bundle 'wincent/Command-T'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'bufkill.vim'
" Syntaxes
Bundle 'mikewest/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'django.vim'
Bundle 'rollxx/vim-antlr'
" Completion
Bundle 'docunext/closetag.vim'
Bundle 'davidhalter/jedi-vim'
" Source Control
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'

filetype plugin indent on     " required!
" End vundle setup

" TOMMOROW-THEME
colorscheme Tomorrow-Night-Bright
if has("gui_running")
	colorscheme Tomorrow-Night
end

" DETECTINDENT
" Turn it on automatically, but prefer hard tabs
autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_expandtab = 0

" NERDTREE
" Open iff no file is given
autocmd vimenter * if !argc() | NERDTree | endif
" if nerdtree is the last buffer, open an empty buffer
" don't need this so long as we use :BD (mapped to <leader>q)
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | enew | NERDTree | endif

" CLOSETAG
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1

autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
