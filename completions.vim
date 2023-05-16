
" asyncomlete """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'blocklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))

" call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
"     \ 'name': 'neosnippet',
"     \ 'allowlist': ['*'],
"     \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
"     \ }))


inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"

" Copilot """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
