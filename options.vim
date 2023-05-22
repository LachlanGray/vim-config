
" editing
set autoread
set showcmd
set laststatus=2
set hidden
set virtualedit=all
set backspace=2
set nocompatible
set fileencoding=utf-8
set encoding=utf-8
set completeopt=menu,noinsert

set wildmenu wildoptions=pum

" indent guides
" set list
" autocmd BufEnter shiftwidth execute 'setlocal listchars=trail:·,tab:│\ ,multispace:┆' . repeat('\ ', &sw - 1)

" highlight SignColumn guibg=#343f44

set cursorline
set scrolloff=8
set nowrap

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

set termguicolors

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


""""""""""""""""""""""""""""""""""""""""

