setlocal omnifunc=gocomplete#Complete
setlocal completeopt-=preview

let g:syntastic_go_checkers = ['govet']

setlocal nolist

autocmd BufWritePre *.go :%s/\s\+$//e

" autoformat *.go files with "gofmt" upon save
autocmd BufWritePre *.go :Fmt
