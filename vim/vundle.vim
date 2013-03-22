" Vundle setup
set shell=/bin/bash " makes vundle behave in macvim
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles to install
Bundle 'airblade/vim-gitgutter'
Bundle 'mikewest/vim-markdown'
"Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'docunext/closetag.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'davidhalter/jedi-vim'
Bundle 'chriskempson/vim-tomorrow-theme'

filetype plugin indent on     " required!
" End vundle setup
