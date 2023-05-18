
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 400
let g:lsp_diagnostics_float_insert_mode_enabled = 0

let g:lsp_diagnostics_signs_error = {'text': '●'}
let g:lsp_diagnostics_signs_warning = {'text': '•'}
let g:lsp_diagnostics_signs_information = {'text': '•'}
let g:lsp_diagnostics_signs_hint = {'text': '•'}

highlight LspErrorText       guibg=#343f44 guifg=#e67e80
highlight LspWarningText     guibg=#343f44 guifg=#dbbc7f
highlight LspInformationText guibg=#343f44 guifg=#d699b6
highlight LspHintText        guibg=#343f44 guifg=#7fbbb3


let g:lsp_format_sync_timeout = 1000

" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')

let g:asyncomplete_log_file = expand('~/asyncomplete.log')


" NOTE: check strictParameterNoneValue if pyright complains
if executable('pyright')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyright',
        \ 'cmd': {server_info->['pyright-langserver', '--stdio']},
        \ 'allowlist': ['python'],
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(
        \  lsp#utils#find_nearest_parent_file_directory(
        \    lsp#utils#get_buffer_path(),
        \    ['pyrightconfig.json', 'setup.py', '.git/']
        \  ))},
        \ 'workspace_config': {
        \     'python': {
        \         'analysis': {
        \             'typeCheckingMode': 'off',
        \             'diagnosticsMode': 'openFilesOnly',
        \             'diagnosticSeverityOverrides': {
        \                 'strictParameterNoneValue': 'false',
        \                 'reportMissingImports': 'error',
        \                 'reportUndefinedVariable': 'error',
        \                 'reportAssertAlwaysTrue': 'warning',
        \                 'reportWildcardImportFromLibrary': 'warning',
        \                 'reportGeneralTypeIssues': 'warning',
        \                 'reportOptionalSubscript': 'warning',
        \                 'reportOptionalMemberAccess': 'warning',
        \                 'reportOptionalCall': 'warning',
        \                 'reportOptionalIterable': 'warning',
        \                 'reportOptionalContextManager': 'warning',
        \                 'reportOptionalOperand': 'warning',
        \                 'reportTypedDictNotRequiredAccess': 'warning',
        \                 'reportPrivateImportUsage': 'error',
        \                 'reportUnboundVariable': 'error',
        \                 'reportUnusedCoroutine': 'warning',
        \                 'reportConstantRedefinition': 'warning',
        \                 'reportDeprecated': 'warning',
        \                 'reportDuplicateImport': 'warning',
        \                 'reportPrivateUsage': 'error',
        \                 'reportUnnecessaryCast': 'warning',
        \                 'reportUnnecessaryComparison': 'warning',
        \                 'reportUnnecessaryContains': 'warning',
        \                 'reportUnnecessaryIsInstance': 'warning',
        \                 'reportUnusedImport': 'warning',
        \                 'reportUnusedVariable': 'warning',
        \             },
        \         }
        \     }
        \ },
  \ })
endif


function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    " nmap <buffer> gs <plug>(lsp-document-symbol-search)
    " nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    " nmap <buffer> gt <plug>(lsp-type-definition)
    " nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-error)
    nmap <buffer> ]g <plug>(lsp-next-error)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-k> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-j> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
