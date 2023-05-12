let g:vim_config_path = '~/.config/vim/'

function! SourceConfigFile(file)
  exec 'source ' . g:vim_config_path . a:file . '.vim'
endfunction

call SourceConfigFile('options')
call SourceConfigFile('keymap')
call SourceConfigFile('plugins')
call SourceConfigFile('appearance')
call SourceConfigFile('files')
call SourceConfigFile('git')
call SourceConfigFile('lsp')

autocmd VimEnter * if filereadable("scripts.vim") | source scripts.vim | endif


"	- TODO: lsp https://github.com/yegappan/lsp
"	- TODO: copilot https://github.com/github/copilot.vim
"	    - you can check if the popup is open with: echo &pumvisible
"	    - then, you can interpret tab based on this elegantly:
"
"	        " Map <C-n> and <C-p> to move up and down the popup menu
"           inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<Tab>"
"           inoremap <expr> <C-p> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
"           " Map <C-y> to select the current popup menu item
"           inoremap <expr> <C-y> pumvisible() ? "\<C-y>" : "\<CR>"
"
"           " Map <C-e> to close the popup menu without inserting any completion
"           inoremap <expr> <C-e> pumvisible() ? "\<C-e>" : "\<Esc>"
"
"	- chatgpt :)
"	- consider vim-dispatch 
"	
