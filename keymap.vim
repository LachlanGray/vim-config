inoremap <special> kj <Esc>

noremap <Space> <Nop>
let mapleader=" "
let maplocalleader=" "

nmap <leader>w <C-w>

nnoremap gp <cmd>bpre<CR>
nnoremap gn <cmd>bnext<CR>

nnoremap <Esc> <cmd>noh<CR>

nnoremap <C-w>al <cmd>vertical resize +5<CR>
nnoremap <C-w>ah <cmd>vertical resize -5<CR>
nnoremap <C-w>ak <cmd>resize +5<CR>
nnoremap <C-w>aj <cmd>resize -5<CR>

" remap to open in new tab and retain the cursor position
" nnoremap <C-w>t <cmd>tabnew %<CR><cmd>only<CR>
"
" get cursor location, open new tab, open file, go to location
function! ExpandFileAtCursor()
  let l:cached_line = line('.')
  let l:cached_col = col('.')
  execute 'tabnew' expand('%')
  call cursor(l:cached_line, l:cached_col)
endfunction

nnoremap <C-w>t :call ExpandFileAtCursor()<CR>


"TODO: mapping that checks if the screen is shifted by "z" command, if so
"remap 0 to %

" terminal """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup TerminalSettings
  autocmd!
  autocmd TerminalOpen * if bufname('%') !=# 'lf' | tnoremap <buffer> kj <C-\><C-n> | endif
augroup END

