
function! macro_edit#edit(register) abort
    let l:buffer_name = '@'.a:register

    if bufexists(l:buffer_name)
        execute 'split' l:buffer_name
        resize 10
        setlocal buftype=nofile bufhidden=hide noswapfile wrap nobuflisted nomodified
    else
        let l:macro_content = getreg(a:register)
        let l:macro_type = getregtype(a:register)

        new
        resize 10
        exec 'file' l:buffer_name
        setlocal buftype=nofile bufhidden=hide noswapfile wrap nobuflisted nomodified
        call setline(1, l:macro_content)

        function! s:save_and_update_macro() abort closure
            let l:updated_macro = getline(1, '$')
            call setreg(a:register, l:updated_macro, l:macro_type)
            setlocal nomodified
        endfunction

        autocmd BufLeave <buffer> call <SID>save_and_update_macro()
    endif
endfunction


command! -nargs=1 -complete=command EditMacro call macro_edit#edit(<q-args>)
nnoremap <leader>em :EditMacro<space>
