" Remap navigation keys for Dvorak
noremap T gj
noremap N gk
noremap t j
noremap n k
noremap s l
noremap H _
noremap S g_
vnoremap S g_
vnoremap l S

" make keys easier to reach
" <Esc> should now be mapped to Caps Lock
" inoremap hh <Esc>
noremap ; :

" remap indentation keys in normal mode
nnoremap < <<
nnoremap > >>

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
" Move between splits with either <leader>H/T/N/S
" or <A-h/t/n/s>
nmap <silent> <leader>H :wincmd h<CR>
nmap <silent> <leader>T :wincmd j<CR>
nmap <silent> <leader>N :wincmd k<CR>
nmap <silent> <leader>S :wincmd l<CR>
nmap <leader>v <C-w>v
" We have to put the actual chars produced here due to a MacVim quirk
nmap <silent> ˙ :wincmd h<CR>
nmap <silent> † :wincmd j<CR>
nmap <silent> ˜ :wincmd k<CR>
nmap <silent> ß :wincmd l<CR>
" wrap para
nnoremap <leader>w gqip
" plugins below
" open cmdt for Symbols, Files or Buffers and open buffer List
nnoremap <silent> <leader>s :CommandTTag<CR>
nnoremap <silent> <leader>f :CommandT<CR>
nnoremap <silent> <leader>b :CommandTBuffer<CR>
nnoremap <silent> <leader>l :TagbarToggle<CR>
nnoremap <silent> <leader>T :NERDTreeFocus<CR>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>F :set invfullscreen<CR>
" unload buffer, load last buffer if one exists
nnoremap <silent> <leader>q :BD<CR>
" git stuff
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gh :Gbrowse<CR>
nnoremap <leader>gg :Git<Space>
" lookup documentation
nnoremap <leader>dd :Dash<Space>
nmap <leader>ds <Plug>DashSearch

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
" Pip install from requirements.txt/setup.py
command Pr !pip install -r requirements.txt
command Ps !pip install -e .
