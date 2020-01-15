function! s:try_insert(skel)
    execute "normal! i" . a:skel . "\<C-r>=UltiSnips#ExpandSnippet()\<CR>"
    if g:ulti_expand_res == 0
        silent! undo
    endif

    return g:ulti_expand_res
endfunction

function! utils#pysnips#InsertSkeleton() abort
    " Abort non-empty buffer or extant file
    if !exists('g:did_UltiSnips_plugin') || !(line('$')) == 1 && getline('$') == ''
        return
    endif

    call s:try_insert("tdc")
endfunction
