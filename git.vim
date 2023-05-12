
" git gutter appearances """"""""""""""""""""""""""""""""""""""""

let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '‾'
let g:gitgutter_sign_modified_removed = '│' 

let g:gitgutter_sign_priority = 9

autocmd ColorScheme * highlight SignColumn            guibg=#343f44
autocmd ColorScheme * highlight GitGutterAdd          guibg=#343f44 guifg=#a7c080
autocmd ColorScheme * highlight GitGutterChange       guibg=#343f44 guifg=#7fbbb3
autocmd ColorScheme * highlight GitGutterDelete       guibg=#343f44 guifg=#e67e80
autocmd ColorScheme * highlight GitGutterChangeDelete guibg=#343f44 guifg=#d699b6

let g:gitgutter_preview_win_location = 'bo'


" git mappings """"""""""""""""""""""""""""""""""""""""

let g:gitgutter_map_keys = 0
nnoremap ]c <Plug>(GitGutterNextHunk)
nnoremap [c <Plug>(GitGutterPrevHunk)
nnoremap <leader>gd <Plug>(GitGutterPreviewHunk)
nnoremap <Leader>gb <cmd><C-u>call gitblame#echo()<CR>


