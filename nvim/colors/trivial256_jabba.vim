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
let g:colors_name="trivial256"

" color terminal definitions
hi VertSplit    guifg=lightgray guibg=darkgray gui=reverse
hi Folded       guifg=blue guibg=lightcyan
hi IncSearch    guifg=darkgray guibg=yellow
hi Visual       guifg=blue guibg=white gui=reverse
hi Comment      guifg=darkgray gui=bold
hi Constant     guifg=blue
hi Literal      guifg=blue
hi Identifier   guifg=magenta gui=none
hi Keyword      guifg=magenta
hi String       guifg=green
hi Float        guifg=darkblue
hi Boolean      guifg=darkblue
hi Number       guifg=darkblue
hi Statement    guifg=darkblue
hi PreProc      guifg=blue
hi Type         guifg=blue
hi Special      guifg=darkblue gui=none
hi Underlined   guifg=blue gui=underline
hi Todo         guifg=blue guibg=yellow gui=none

" vim: set fdl=0 fdm=marker:
