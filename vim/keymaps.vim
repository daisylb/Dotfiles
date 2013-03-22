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
