inoremap <special> kj <Esc>

noremap <Space> <Nop>
let mapleader=" "
let maplocalleader=" "

nnoremap <leader>w <C-w>

nnoremap gp <cmd>bpre<CR>
nnoremap gn <cmd>bnext<CR>

nnoremap <Esc> <cmd>noh<CR>

augroup TerminalSettings
  autocmd!
  autocmd TerminalOpen * if bufname('%') !=# 'lf' | tnoremap <buffer> kj <C-\><C-n> | endif
augroup END


