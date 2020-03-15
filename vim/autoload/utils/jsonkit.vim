function! Prettify()
    execute "%!python -m json.tool" | w
endfunction

autocmd! bufwritepost *.json call Prettify()
