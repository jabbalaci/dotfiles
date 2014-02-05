" jump to each of the pep8 violations in the quickfix window
let g:pep8_map='<leader>8'

" remove automatic line numbers and put everything else back
let g:pymode_options = 0
setlocal complete+=t
setlocal formatoptions-=t
"if v:version > 702 && !&relativenumber
"    setlocal number
"endif
setlocal nowrap
setlocal textwidth=79
setlocal commentstring=#%s
setlocal define=^\s*\\(def\\\\|class\\)

" from http://unlogic.co.uk/posts/vim-python-ide.html
" TODO: customize it to my needs
" Activate rope
" Keys:
" K             Show python docs
"   Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"let g:pymode_rope = 1
let g:pymode_rope = 0    " use jedi-vim instead

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_checkers = ["pyflakes", "pep8"]
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" jedi-vim customizations
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_on_dot = 0

autocmd BufWritePre *.py :%s/\s\+$//e


" syntastic
let g:syntastic_python_checkers=['pylint']
let g:syntastic_python_pylint_post_args='--disable=C0111,C0103'
"let g:syntastic_python_checker_args='--ignore=E501,E225'
