
let g:everforest_background = 'medium'
set background=dark
let g:everforest_better_performance = 1
colorscheme everforest

 function! LightlineGitGutterStatus() abort
   let [added, modified, removed] = GitGutterGetHunkSummary()
   if added == 0 && modified == 0 && removed == 0
     return ''
   else
     return printf('+%d ~%d -%d', added, modified, removed)
   endif
 endfunction

let g:lightline = {
  \ 'colorscheme': 'everforest',
  \ 'active': {
        \ 'left': [ [ 'readonly', 'filename', 'modified'],
        \           [ 'gitdiff' ],
        \           [ '' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ],
        \            [ 'gitbranch', 'filetype' ] ]
 \  },
  \ 'inactive':{
        \ 'left': [ [ 'filename' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'gitdiff': 'LightlineGitGutterStatus'
  \ }
\ }



