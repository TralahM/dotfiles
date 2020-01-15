augroup ultisnips_custom
    autocmd!
    autocmd BufNewFile *.py silent! call utils#pysnips#InsertSkeleton()
augroup END
