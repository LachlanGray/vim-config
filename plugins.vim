call plug#begin()
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'
  Plug 'RRethy/vim-illuminate'
  Plug 'Sheerun/vim-polyglot'
  Plug 'Sainnhe/everforest'
  Plug 'airblade/vim-gitgutter'
  Plug 'zivyangll/git-blame.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/lightline.vim'
  Plug 'thaerkh/vim-indentguides'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'LachlanGray/lmql-syntax'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/asyncomplete-buffer.vim'  "setup
  Plug 'prabirshrestha/asyncomplete-file.vim'  "setup
  Plug 'github/copilot.vim'
  " Plug 'Shougo/neosnippet.vim'  "setup
  " Plug 'prabirshrestha/asyncomplete-neosnippet.vim'  "setup
call plug#end()

