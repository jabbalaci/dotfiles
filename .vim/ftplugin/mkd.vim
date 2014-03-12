let g:vim_markdown_folding_disabled=1

autocmd BufWritePre *.md :%s/\s\+$//e
autocmd BufWritePre *.markdown :%s/\s\+$//e
