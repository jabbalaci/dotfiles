autocmd BufWritePre *.html :%s/\s\+$//e

" https://github.com/Glench/Vim-Jinja2-Syntax
" Figure out which type of hilighting to use for html.
" fun! s:SelectHTML()
" let n = 1
" while n < 50 && n <= line("$")
"   " check for jinja
"   if getline(n) =~ '{%\s*\(end.*\|extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
"     set ft=jinja
"     return
"   endif
"     let n = n + 1
"   endwhile
" endfun
" autocmd BufNewFile,BufRead *.jinja2,*.jinja,*.html,*.htm,*.nunjucks  call s:SelectHTML()
