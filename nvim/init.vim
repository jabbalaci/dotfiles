"
" NeoVim config file of Jabba Laci (jabba.laci@gmail.com)
" last change: 2016.05.08. (yyyy.mm.dd.)
"
" To use it, copy it to
"     ~/.config/nvim/init.vim
"
" HQ:
"     https://neovim.io
" Docs:
"     https://neovim.io/doc/user/
"

" Autoinstall vim-plug {{{
    " https://github.com/junegunn/vim-plug
    let s:vim_plug_dir=expand($HOME.'/.config/nvim/autoload')
    if !filereadable(s:vim_plug_dir.'/plug.vim')
        execute '!wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P '.s:vim_plug_dir
        let s:install_plug=1
    endif
" }}}

call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" ====================================================================
" Completion
" ====================================================================
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" {{{
    " Group dependencies, vim-snippets depends on ultisnips
" }}}

" ====================================================================
" Appearance
" ====================================================================
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" {{{
    " https://github.com/vim-airline/vim-airline
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
    " also install the system package 'powerline-fonts'
    let g:airline_powerline_fonts = 1
    " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1
    " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'

    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = '|'
" }}}

" https://github.com/hkupty/nvimux
Plug 'hkupty/nvimux'

" ====================================================================
" Buffers
" ====================================================================
Plug 'vim-scripts/BufOnly.vim'
" {{{
    " :BufOnly closes all buffers except the current one
" }}}

" ====================================================================
" File Navigation
" ====================================================================
Plug 'scrooloose/nerdtree'
" {{{
    map <F1> :call NERDTreeToggleAndFind()<cr>
    map <F2> :NERDTreeToggle<CR>

    function! NERDTreeToggleAndFind()
        if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
            execute ':NERDTreeClose'
        else
            execute ':NERDTreeFind'
        endif
    endfunction

    "let g:NERDTreeMinimalUI = 1
    "let g:NERDTreeHijackNetrw = 0
    "let g:NERDTreeWinSize = 31
    "let g:NERDTreeChDirMode = 2
    "let g:NERDTreeAutoDeleteBuffer = 1
    "let g:NERDTreeShowBookmarks = 1
    "let g:NERDTreeCascadeOpenSingleChildDir = 1
" }}}

"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" ====================================================================
" File Navigation
" ====================================================================
" Plugin outside ~/.config/nvim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{{
    " :h fzf-vim-commands
    "let g:fzf_command_prefix = 'Fzf'
    let g:fzf_action = {
          \ 'ctrl-s': 'split',
          \ 'ctrl-v': 'vsplit'
          \ }
    let g:fzf_layout = { 'right': '50%' }
    set splitbelow splitright
    nnoremap <c-p> :FZF<cr>
" }}}

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath
call plug#end()

" =================================================================================

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set cursorline

" highlight the current line
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" color scheme
if filereadable($HOME."/LIGHT_BACKGROUND")
    " for light background
    colorscheme trivial256
    hi LineNr       term=bold cterm=bold ctermfg=2 guifg=Grey guibg=Grey90
    hi CursorLine   guibg=#DBE6E0
    "hi CursorLine   guibg=lightcyan
    "hi LineNr       term=bold cterm=bold ctermfg=2 guifg=Grey guibg=LightCyan
    " type :hi to see some color combinations (if you want to change the color
    " of the line numbers)
else
    " for dark background
    colorscheme advantage
    hi LineNr       term=bold cterm=bold ctermfg=2 guifg=DarkGrey guibg=#334C75
    "hi LineNr       term=bold cterm=bold ctermfg=2 guifg=Grey
    "guibg=Grey90
    "colorscheme elflord
endif

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc

"VimTip 66: Transfer text between two Vim 'sessions' {{{
    " transfer/read and write one block of text between vim sessions
    " Usage:
    " `from' session:
    "     ma
    "     move to end-of-block
    "     xw
    "
    " `to' session:
    "     move to where I want block inserted
    "     xr
    "
    nmap xr   :r $HOME/.vimxfer<CR>
    nmap xR   :-r $HOME/.vimxfer<CR>
    nmap xw   :'a,.w! $HOME/.vimxfer<CR>
    vmap xr   c<esc>:r $HOME/.vimxfer<CR>
    vmap xR   c<esc>:-r $HOME/.vimxfer<CR>
    vmap xw   :w! $HOME/.vimxfer<CR>
" }}}

"VimTip 20: Are *.swp and *~ files littering your working directory? {{{
    set backup
    set backupext=~
    set backupdir=~/tmp/nvim,./.backup,.,/tmp
    set directory=~/tmp/nvim,./.backup,.,/tmp
" }}}

" when re-opening a file, jump back to the previous position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"To define a mapping which uses the 'mapleader' variable, the special string
"'<Leader>' can be used.  It is replaced with the string value of 'mapleader'.
"If 'mapleader' is not set or empty, a backslash is used instead.
let mapleader = ","

" use Ctrl-a as prefix
"let g:nvimux_prefix='<C-a>'

" use system clipboard
set clipboard+=unnamedplus

"VimTip 305: Best of VIM Tips (VIM's best Features)
"MAKE IT EASY TO UPDATE/RELOAD_vimrc
"src: source rc file
"erc: edit rc file
nnoremap <Leader>src :source $HOME/.config/nvim/init.vim<CR>
nnoremap <Leader>erc :e $HOME/.config/nvim/init.vim<CR>

nnoremap <c-k> :bd<CR>
inoremap <c-k> <Esc>:bd<CR>

map <c-b><c-n> :bnext<CR>
map <c-b><c-b> :bprevious<CR>
nmap <Leader>c :enew<CR>
map <c-x>\| :vsplit<CR>
map <c-x>\ :vsplit<CR>
map <c-x>/ :vsplit<CR>
map <c-x>- :split<CR>
map <c-x>3 :vsplit<CR>
map <c-x>1 :only<CR>

" save
map <c-x><c-s> <ESC>:w<CR>
imap <c-x><c-s> <ESC>:w<CR>i

"############################################################################
"#  START: Jabba's own config :)
"############################################################################

"this way Y is more logical
map Y y$

"VimTip 224: Shifting blocks visually
:vnoremap < <gv
:vnoremap > >gv

"############################################################################
"#  Function keys
"############################################################################

"switch spell check on/off (grammar check)
setlocal spell spelllang=en_us      "let's use English by default
set nospell                         "by default spell is off

"change wrap
map <F6> :set wrap!<CR>

"change number
map <F7> :set number!<CR>

"quit
"map <F10> :q<CR>

"############################################################################
"#  Navigation / Windows
"############################################################################

" centre the screen on the current search result
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"############################################################################
"#  other
"############################################################################

set matchpairs+=<:>         " show matching <> (html mainly) as well

" don't outdent hashes
inoremap # #

"====[ Make the 81st column stand out ]==================== {{{
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%101v', 100)    " I set it to 100
    "call matchadd('ColorColumn', '\%121v', 100)   " column 120
    "call matchadd('ColorColumn', '\%81v', 100)    " column 80
" }}}

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]====== {{{
    exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    set list
" }}}

" (http://unlogic.co.uk/posts/vim-python-ide.html)
" Use l to toggle display of whitespace
nmap l :set list!<CR>
" And set some nice chars to do it with
"set listchars=tab:»\ ,eol:¬
" automatically change window's cwd to file's dir
set autochdir

" remove trailing whitespaces {{{
    autocmd BufWritePre *.txt :%s/\s\+$//e
    autocmd BufWritePre *.md :%s/\s\+$//e
    autocmd BufWritePre *.h :%s/\s\+$//e
    autocmd BufWritePre *.tex :%s/\s\+$//e
    autocmd BufWritePre *.vim :%s/\s\+$//e
" }}}

" use Ctrl+Space for autocompletion
" http://stackoverflow.com/questions/510503
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" when going back to a terminal, switch to insert mode automatically
autocmd BufWinEnter,WinEnter term://* startinsert

" terminal emulator {{{
    " https://www.reddit.com/r/neovim/comments/3wqo0i/nvim_terminal/
    """""""""""""""
    " this way ESC-0 works in the terminal in Midnight Commander to quit mc:
    tnoremap <esc><esc> <C-\><C-n>
    " Move between windows
    tnoremap <A-left> <C-\><C-n><C-w>h
    tnoremap <A-down> <C-\><C-n><C-w>j
    tnoremap <A-up> <C-\><C-n><C-w>k
    tnoremap <A-right> <C-\><C-n><C-w>l
    nnoremap <A-left> <C-w>h
    nnoremap <A-down> <C-w>j
    nnoremap <A-up> <C-w>k
    nnoremap <A-right> <C-w>l
    "
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
" }}}

" own shortcuts to open terminal
nmap <c-x>t :vsplit<cr><c-w><c-w>:term<cr>
nmap <c-x>T :split<cr><c-w><c-w>:term<cr>

" close window
nmap <c-q> <c-w>q

" This makes the cursor a pipe in insert-mode, and a block in normal-mode.
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" trial and error
" uppercase the current word
imap <c-u> <esc><right>viwUi
map <c-u> viwU

