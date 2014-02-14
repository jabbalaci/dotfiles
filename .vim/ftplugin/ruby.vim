"use a different indenting for Ruby files (2 spaces)
autocmd FileType ruby setlocal sts=2 et

autocmd BufWritePre *.rb :%s/\s\+$//e
