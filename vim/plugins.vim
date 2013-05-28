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
Bundle 'Lokaltog/powerline'
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
Bundle 'rodjek/vim-puppet'
Bundle 'fountain.vim'
" Completion
Bundle 'docunext/closetag.vim'
Bundle 'davidhalter/jedi-vim'
" Source Control
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'

filetype plugin indent on     " required!
" End vundle setup

" TOMMOROW-THEME
colorscheme Tomorrow-Night

" DETECTINDENT
" Turn it on automatically, but prefer hard tabs
autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_expandtab = 0

" NERDTREE
let NERDTreeShowHidden=1
" Open iff no file is given
autocmd vimenter * if !argc() | NERDTree | endif
" change Vim wd whenever NERDTree wd is changed
let NERDTreeChDirMode=2
" single click on dirs to open them
let NERDTreeMouseMode=2
let NERDTreeMinimalUI=1
" if nerdtree is the last buffer, open an empty buffer
" don't need this so long as we use :BD (mapped to <leader>q)
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | enew | NERDTree | endif

" CLOSETAG
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1

autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" POWERLINE (not installed using vundle)
set rtp+=~/.vim/bundle/powerline/bindings/vim
