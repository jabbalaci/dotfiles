let g:vim_json_syntax_conceal = 0

autocmd BufWritePre *.json :%s/\s\+$//e
