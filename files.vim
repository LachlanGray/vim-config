
" fzf """"""""""""""""""""""""""""""""""""""""

" custom fzf functions """"""""""

" override to remove preview
command! -bang -nargs=? -complete=dir 
    \ Files call fzf#vim#files(
          \ <q-args>,
          \ {'options': [
          \     '--no-preview'
          \ ]},
          \ <bang>0
    \ )

command! -bang -nargs=? -complete=dir 
    \ Buffers call fzf#vim#buffers(
          \ {'options': [
          \     '--no-preview'
          \ ]},
          \ <bang>0
    \ )

" delete buffers (from https://www.reddit.com/r/neovim/comments/mlqyca/fzf_buffer_delete/)
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! DeleteBuffers call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi'
\ }))
  
"NOTE: you can add bindings to fzf like: --bind ctrl-a:select-all+accept


" fzf mappings """"""""""""""""

nnoremap <leader>f <cmd>Files<CR>
nnoremap <leader>F <cmd>Rg<CR>
nnoremap <leader>k <cmd>Buffers<CR>
nnoremap <leader>K <cmd>DeleteBuffers<CR>


" lf """"""""""""""""""""""""""""""""""""""""

function! LF()
    let buf = term_start(['lf'], #{hidden: 1, term_finish: 'close'})
    let winid = popup_create(buf, #{
          \ minwidth: 105,
          \ minheight: 20,
          \ border: [],
          \ borderchars: ['─', '│', '─', '│', '┌', '┐', '┘', '└']
    \ })
    tnoremap <buffer> <Esc> q
    tnoremap <buffer> w q
    autocmd BufLeave <buffer> call popup_close('close') | silent! execute 'bdelete' expand('<afile>')
endfunction


nnoremap <leader>lf :call LF()<CR>


