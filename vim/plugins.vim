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
Bundle 'ciaranm/detectindent'
Bundle 'Lokaltog/powerline'
Bundle 'sjl/vitality.vim'
" Colours
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'chriskempson/base16-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'noahfrederick/Hemisu'
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
Bundle 'scrooloose/syntastic'
" Completion
Bundle 'docunext/closetag.vim'
" Bundle 'davidhalter/jedi-vim'
Bundle 'Valloric/YouCompleteMe'
" Documentation
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
" Source Control
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'

filetype plugin indent on     " required!
" End vundle setup

" Colouring
colorscheme Tomorrow-Night

" DETECTINDENT
" Turn it on automatically, but prefer hard tabs
" autocmd BufReadPost * :DetectIndent
" let g:detectindent_preferred_expandtab = 0

" COMMAND-T
" TODO: figure out how to map keys only when the list has focus
let g:CommandTMatchWindowReverse = 1

" NERDTREE
let NERDTreeShowHidden=1
" Open iff no file is given
" this is disabled in order to encourage only showing it when required
" autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeQuitOnOpen=1
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

" YOUCOMPLETEME
let g:ycm_autoclose_preview_window_after_insertion = 1

" POWERLINE (not installed using vundle)
set rtp+=~/.vim/bundle/powerline/bindings/vim
