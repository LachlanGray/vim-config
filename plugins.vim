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
call plug#end()

