
" colourscheme
let g:everforest_background = 'medium'
set background=dark
let g:everforest_better_performance = 1
colorscheme everforest


" lightline
function! GetGitGutterStatus() abort
  let [added, modified, removed] = GitGutterGetHunkSummary()
  let parts = []
  if added != 0
    call add(parts, printf('+%d', added))
  endif
  if modified != 0
    call add(parts, printf('~%d', modified))
  endif
  if removed != 0
    call add(parts, printf('-%d', removed))
  endif

  if len(parts) == 0
    return ''
  else
    return join(parts, ' ')
  endif
endfunction

function! GitOrDiagnostics() abort
  let diagnostic_counts = lsp#get_buffer_diagnostics_counts()
  let symbols = {'error': '✖ ', 'warning': '⚠ ', 'information': '☀ ', 'hint': '★ '}
  let parts = []

  for level in ['error', 'warning', 'hint', 'information']
    if has_key(diagnostic_counts, level) && diagnostic_counts[level] != 0 && has_key(symbols, level)
      let symbol = symbols[level]
      call add(parts, printf('%s%d', symbol, diagnostic_counts[level]))
    endif
  endfor

  if len(parts) == 0
    let [added, modified, removed] = GitGutterGetHunkSummary()
    if added == 0 && modified == 0 && removed == 0
      return ''
    else
      return GetGitGutterStatus()
    endif
  else
    return join(parts, ' ')
  endif
endfunction


function! NothingOrGit() abort
  let diagnostic_counts = lsp#get_buffer_diagnostics_counts()
  let parts = []
  let diagnostics_present = 0
  for [level, count] in items(diagnostic_counts)
    if count != 0
      let diagnostics_present = 1
    endif
  endfor

  if diagnostics_present == 1
    let [added, modified, removed] = GitGutterGetHunkSummary()
    if added == 0 && modified == 0 && removed == 0
      return ''
    else
      return GetGitGutterStatus()
    endif
  else
    return ''
  endif
endfunction


let g:lightline = {
  \ 'colorscheme': 'everforest',
  \ 'active': {
        \ 'left': [ [ 'readonly', 'filename', 'modified'],
        \           [ 'git_or_diagnostics' ],
        \           [ 'nothing_or_git' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ],
        \            [ 'gitbranch', 'filetype' ] ]
 \  },
  \ 'inactive':{
        \ 'left': [ [ 'readonly', 'filename', 'modified'] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'git_or_diagnostics': 'GitOrDiagnostics',
  \   'nothing_or_git': 'NothingOrGit'
  \ }
\ }



