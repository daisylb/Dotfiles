" Remap navigation keys for Dvorak
noremap t gj
noremap n gk
noremap T j
noremap N k
noremap s l
noremap H 0
noremap S $

" make keys easier to reach
inoremap hh <Esc>
noremap ; :

" Remap keys inside netrw
" see http://unix.stackexchange.com/questions/31575/remapping-keys-in-vims-directory-view
augroup netrw_dvorak_fix
    autocmd!
    autocmd filetype netrw call Fix_netrw_maps_for_dvorak()
augroup END
function! Fix_netrw_maps_for_dvorak()
	noremap <buffer> t j
	noremap <buffer> n k
	noremap <buffer> s l
endfunction

" remap 't' in NERDTree
let NERDTreeMapOpenInTab='<leader>K'

" Leader key stuff
let mapleader = ","
" TODO: move between splits with Ctrl+h/t/n/s
" plugins below
" open cmdt for Symbols, Files or Buffers and open buffer List
nnoremap <leader>s :CommandTTag<CR>
nnoremap <leader>f :CommandT<CR>
nnoremap <leader>b :CommandTBuffer<CR>
nnoremap <leader>l :TagbarToggle<CR>
nnoremap <leader>t :NERDTreeFocus<CR>
nnoremap <leader>T :NERDTreeToggle<CR>
nnoremap <leader>F :set invfullscreen<CR>
" unload buffer, load last buffer if one exists
nnoremap <leader>q :BD<CR>

" Commands
" Write, then unload buffer
command Wq w | BD
command Q BD
" Word count command
command Wc w !wc
" Open in Marked
command Mkd !open -a Marked %
" Copy entire document to clipboard
command Cp w !pbcopy
" Convert document from Markdown to HTML, then copy
command Mcp w !pandoc -f markdown -t html | pbcopy
