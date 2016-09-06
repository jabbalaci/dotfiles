" Vim color file
" Maintainer: drauh <drauhx@gmail.com>
"
" This theme is based on "simple256" theme by A. Rodin
"
" Ignored all GUI-mode colors. Set simple terminal colors
" to be visible on iTerm.app for OS X with a light background.
"
" 20130912: light modification by Jabba Laci (changed the color of String)

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="jabba"

" color terminal definitions
" hi VertSplit    guifg=lightgray guibg=darkgray gui=reverse
" hi Folded       guifg=blue guibg=lightcyan
" hi IncSearch    guifg=darkgray guibg=yellow
" hi Visual       guifg=blue guibg=white gui=reverse
hi Comment      guifg=darkgray
" hi Constant     guifg=blue
" hi Literal      guifg=blue
hi Identifier   guifg=green
hi Keyword      guifg=green
hi String       guifg=#c0772c guibg=#fefcf6
hi Float        guifg=#7f5ec4 guibg=#f3f2ff
hi Boolean      guifg=#7f5ec4 guibg=#f3f2ff
hi Number       guifg=#7f5ec4 guibg=#f3f2ff
" hi Statement    guifg=darkblue
" hi PreProc      guifg=blue
" hi Type         guifg=blue
" hi Special      guifg=darkblue gui=none
" hi Underlined   guifg=blue gui=underline
" hi Todo         guifg=blue guibg=yellow gui=none


hi pythonDefClass   guifg=#7d22c1 gui=bold
hi Structure        guifg=#5a89c5
hi Statement        gui=none
hi Include          guifg=green
" hi Function         guifg=#781ac0

" vim: set fdl=0 fdm=marker:
