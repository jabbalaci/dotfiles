"                                _
"                               (_)
"          _ __   ___  _____   ___ _ __ ___
"         | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"         | | | |  __/ (_) \ V /| | | | | | |
"         |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
"
" NeoVim config file of Jabba Laci (jabba.laci@gmail.com)
" last change: 2016.05.15. (yyyy.mm.dd.)
"
" To use it, copy it to
"     ~/.config/nvim/init.vim
"
" HQ:
"     https://neovim.io
" Docs:
"     https://neovim.io/doc/user/
"
" Links:
" * http://vimcasts.org/ (vimcasts contains 68 free screencasts and 47 articles)
" * http://vimawesome.com/ (list of awesome plugins)
" * http://vim.spf13.com/ (it can give you ideas of must-have plugins)
" * https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" * https://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
"

" <Leader>
let mapleader = ","
" <LocalLeader>
let maplocalleader = "\\"

"
" Tips:
"   gx                -> open URL under cursor in your browser
"   :retab            -> replace TABs with 4 spaces
"   :set filetype?    -> current filetype
"
" Jumps:
"   H, M, L   -> high, middle, low: jump to the top / middle / bottom of the screen
"   CTRL-e      Moves screen up one line
"   CTRL-y      Moves screen down one line
"   CTRL-u      Moves screen up ½ page
"   CTRL-d      Moves screen down ½ page
"   CTRL-b      Moves screen up one page      (remapped for me)
"   CTRL-f      Moves screen down one page    (remapped for me)
"
" Help:
"   :h help-context    -> v_ (visual mode commands), etc.
"   :h i_CTRL-Y        -> What does Ctrl-y do in insert mode?
"
" Windows:
"   Ctrl+w =           -> equal size
"   Ctrl+w _           -> maximize window
"

" Autoinstall vim-plug {{{
    " https://github.com/junegunn/vim-plug
    let s:vim_plug_dir=expand($HOME.'/.config/nvim/autoload')
    if !filereadable(s:vim_plug_dir.'/plug.vim')
        execute '!wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P '.s:vim_plug_dir
        let s:install_plug=1
    endif
" }}}

call plug#begin('~/nvim.local/plugged')
" BEGIN

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" ====================================================================
" Remote support
" ====================================================================
" {{{
    " https://github.com/mhinz/neovim-remote
    " $ sudo pip3 install neovim-remote
" }}}


" ====================================================================
" Color schemes
" ====================================================================
Plug 'freeo/vim-kalisi'

" ====================================================================
" Completion
" ====================================================================
" " use Ctrl+Space for autocompletion {{{
"     " http://stackoverflow.com/questions/510503
"     inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"     \ "\<lt>C-n>" :
"     \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"     \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"     \ "\" \\<lt>bs>\\<lt>C-n>\"\<cr>"
"     imap <C-@> <C-Space>
" " }}}

Plug 'Raimondi/delimitMate'
" {{{
    " This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
    " We also need this plugin in a workaround below, which requires this plugin.
    " set matchpairs+=<:>         " show matching <> (html mainly) as well
    " !!! when specifying several file types, there is NO space between them !!!
    autocmd FileType html,vim set matchpairs+=<:>
" }}}

"Plug 'jiangmiao/auto-pairs'
" {{{
    " insert or delete brackets, parens, quotes in pair
" }}}

Plug 'SirVer/ultisnips', { 'on': [] } | Plug 'honza/vim-snippets'

" {{{
    " a bit slow, it will be loaded when the editor started
    " Group dependencies, vim-snippets depends on ultisnips
    " to avoid TAB confusion between UltiSnips and YouCompleteMe
    let g:UltiSnipsExpandTrigger="<C-Space>"
" }}}

" Autocompletion for Python and C-like languages {{{
  " from here: https://github.com/euclio/vimrc/blob/master/plugins.vim
  " Under Manjaro 64-bit I had a problem with the automatic installation, YCM
  " didn't start, libtinfo.so.5 caused an import error for Python.
  " I found the solution here: https://github.com/Valloric/YouCompleteMe/issues/778
  " Steps to follow:
  " $ sudo pacman-key --refresh-keys
  " $ gpg --keyserver pgp.mit.edu --recv-keys C52048C0C0748FEE227D47A2702353E0F7E48EDB
  " $ yaourt -S libtinfo-5
  if has('python') && executable('python2') && executable('cmake')
    function! g:BuildYCM(info)
      if a:info.status ==# 'installed' || a:info.force
        " compiling YCM with semantic support for C-family languages:
        let l:flags = ['--clang-completer']
        " JavaScript support:
        if executable('npm')
          call extend(l:flags, ['--tern-completer'])
        endif
        exec '!python2 ./install.py ' . join(l:flags)
      endif
    endfunction

    Plug 'Valloric/YouCompleteMe', { 'on': [], 'do': function('BuildYCM') }
    " a bit slow, it will be loaded when the editor started
    let g:ycm_autoclose_preview_window_after_completion=1
    " no preview window {{{
        let g:ycm_add_preview_to_completeopt = 0
        set completeopt-=preview
    " }}}
    nnoremap <c-g>  :YcmCompleter GoToDefinitionElseDeclaration<cr>

    let g:ycm_confirm_extra_conf=0          " Disable .ycm_extra_conf confirmation
    let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"
    let g:EclimCompletionMethod='omnifunc'  " Let YCM use Eclipse autocomplete

    " disable TAB in the popup, allowing UltiSnip to work with TAB
    "let g:ycm_key_list_select_completion=[]
    "let g:ycm_key_list_previous_completion=[]

    " A workaround: when the YCM popup appears and you select a hint, you can
    " press Enter to close the popup. This behaviour is similar to other editors.
    imap <expr> <cr> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

    "  if s:has_arch
    "    " Force YCM to use a Python 3 interpreter
    "    let g:ycm_server_python_interpreter='/usr/bin/python3'
    "  endif
  endif
" }}}

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" python with virtualenv support
" thus YouCompleteMe will find the appropriate site packages
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

Plug 'tomtom/tcomment_vim'
" {{{
    " http://vimawesome.com/plugin/tcomment
    " gcc    -> toggle current line (press . to toggle subsequent lines)
    " gc     -> toggle selected lines
" }}}

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" {{{
    " viw    -> visually select the current word
    nnoremap <space> viw
    " select the text, press s and type in the surrounding character / tag
    " cs'"    -> (DON'T select the text) change ' to "
    " ds"     -> (DON'T select the text) delete surrounding "
    " dst     -> (DON'T select the text) delete surrounding tags (for ex. <q> and </q>)
    " cs'<q>  -> (DON'T select the text) change ' to <q>...</q>
    " cst'    -> (DON'T select the text) change surrounding tag to '
    " select text, s ]    -> surround with [ and ] (no space)
    " ----------
    " the s was deprecated and mapped to S (capital s)
    " this is how to go back to the old behaviour:
    vmap s S

    " vim-repeat: https://github.com/tpope/vim-repeat
    " However, I didn't understand how to use it...
    " But here I found an excellent example:
    " http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/

    " here are some own surroundings that are more intuitive for me
    nnoremap <silent> <Plug>SurroundWordWithApostrophe  viw<esc>a'<esc>hbi'<esc>lel
        \ :call repeat#set("\<Plug>SurroundWordWithApostrophe", v:count)<cr>
    nmap <Leader>'  <Plug>SurroundWordWithApostrophe
    "
    nnoremap <silent> <Plug>SurroundWordWithQuote  viw<esc>a"<esc>hbi"<esc>lel
        \ :call repeat#set("\<Plug>SurroundWordWithQuote", v:count)<cr>
    nmap <Leader>"  <Plug>SurroundWordWithQuote
    "
    nnoremap <silent> <Plug>SurroundWordWithBacktick  viw<esc>a`<esc>hbi`<esc>lel
        \ :call repeat#set("\<Plug>SurroundWordWithBacktick", v:count)<cr>
    nmap <Leader>`  <Plug>SurroundWordWithBacktick
    "
    vnoremap <Leader>'  <esc>`<i'<esc>`>la'<esc>
    vnoremap <Leader>"  <esc>`<i"<esc>`>la"<esc>
    vnoremap <Leader>`  <esc>`<i`<esc>`>la`<esc>
" }}}

" ====================================================================
" Syntax checking
" ====================================================================
"Plug 'scrooloose/syntastic'
" {{{
    " http://vimawesome.com/plugin/syntastic
    " for Python support install flake8:
    " $ sudo pip2 install flake8
    " $ sudo pip3 install flake8
    " check file syntax on open:
    " it made opening slow for me:
    "let g:syntastic_check_on_open = 1
" }}}

Plug 'neomake/neomake'
" {{{
    " neomake is async => it doesn't block the editor
    " It's a syntastic alternative. Syntastic was slow for me on python files.
    let g:neomake_python_enabled_makers = ['flake8', 'pep8']
    " E501 is line length of 80 characters
    let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501,E266'], }
    let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=100', '--ignore=E266'], }
" }}}

" run neomake on the current file on every write:
autocmd! BufWritePost * Neomake

" Plug 'nvie/vim-flake8'
" " {{{
"     autocmd FileType python map <buffer> <F3> :call Flake8()<cr>
"     let python_highlight_all=1
" " }}}

" ====================================================================
" Session management
" ====================================================================
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
" {{{
    " allows you to save and restore the current session (restart vim)
    " :SaveSession    -> save the session
    " :OpenSession    -> load the saved session
    let g:session_autosave = 'no'
    let g:session_autoload = 'no'
    let g:session_directory = '~/nvim.local/sessions'
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

"Plug 'hkupty/nvimux'
" {{{
    " https://github.com/hkupty/nvimux
    " use Ctrl-a as prefix
    "let g:nvimux_prefix='<C-a>'
    noremap <c-b><c-n> :bnext<cr>
    noremap <C-PageDown> :bnext<cr>
    noremap <c-b><c-b> :bprevious<cr>
    noremap <C-PageUp> :bprevious<cr>
    nnoremap <Leader>c :enew<cr>
" }}}

" ====================================================================
" Buffers
" ====================================================================
Plug 'vim-scripts/BufOnly.vim'
" {{{
    " :BufOnly closes all buffers except the current one
" }}}

" ====================================================================
" Navigation
" ====================================================================
Plug 'scrooloose/nerdtree'
" {{{
    noremap <F1> :call NERDTreeToggleAndFind()<cr>
    noremap <F2> :NERDTreeToggle<cr>

    function! NERDTreeToggleAndFind()
        if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
            execute ':NERDTreeClose'
        else
            execute ':NERDTreeFind'
        endif
    endfunction

    let g:NERDTreeQuitOnOpen = 1
    let NERDTreeIgnore=['\.pyc$', '\~$']    " ignore files in NERDTree

    "let g:NERDTreeMinimalUI = 1
    "let g:NERDTreeHijackNetrw = 0
    "let g:NERDTreeWinSize = 31
    let g:NERDTreeChDirMode = 2
    "let g:NERDTreeAutoDeleteBuffer = 1
    let g:NERDTreeShowBookmarks = 1
    "let g:NERDTreeCascadeOpenSingleChildDir = 1
" }}}

Plug 'easymotion/vim-easymotion'
" {{{
    " http://vimawesome.com/plugin/easymotion
    let g:EasyMotion_do_mapping = 0 " Disable default mappings
    " Turn on case insensitive feature
    let g:EasyMotion_smartcase = 1
    " <Leader>w    -> search word
    map <Leader>w <Plug>(easymotion-bd-w)
    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " `s{char}{label}`
    " nmap s <Plug>(easymotion-overwin-f)
    " or
    " `s{char}{char}{label}`
    " Need one more keystroke, but on average, it may be more comfortable.
    nmap <Leader>s <Plug>(easymotion-overwin-f2)

    " JK motions: motions (j: down, k: up, l: line, up and down)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>l <Plug>(easymotion-bd-jk)
    " If you want to use more useful mappings, please see :h easymotion.txt for more detail.
" }}}

" Plugin outside ~/.config/nvim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{{
    " Ctrl-f      -> find
    " :Files      -> find files recursively from the current dir.
    " :Files ~    -> find files recursively from the specified dir.
    " :Colors     -> browse and preview color schemes
    " :h fzf-vim-commands
    "let g:fzf_command_prefix = 'Fzf'
    let g:fzf_action = {
          \ 'ctrl-s': 'split',
          \ 'ctrl-v': 'vsplit'
          \ }
    " ^ Enter: open in new buffer
    " let g:fzf_layout = { 'right': '50%' }
    set splitbelow splitright
    nnoremap <c-f> :FZF<cr>

    " Open in horizontal split
    " opens :Lines with some settings ('down')
    nnoremap <silent> <c-l> :call fzf#vim#lines({
    \   'down': '40%' })<cr>

    " " Open files in vertical horizontal split
    " nnoremap <silent> <Leader>v :call fzf#run({
    " \   'right': winwidth('.') / 2,
    " \   'sink':  'vertical botright split' })<cr>
" }}}

"Plug 'ctrlpvim/ctrlp.vim'
" {{{
    " https://github.com/ctrlpvim/ctrlp.vim
" }}}

Plug 'shougo/unite.vim' | Plug 'shougo/neomru.vim'
" {{{
    " Ctrl-p    -> since we are used to it
    " http://vimawesome.com/plugin/unite-vim
    " https://github.com/shougo/neomru.vim , this is required for file_mru
    function! s:unite_settings()
       imap <buffer><tab>           <c-x><c-f>
       nmap <silent><buffer><esc>   :bd<cr>
       imap <buffer><c-p>   <Plug>(unite_select_previous_line)
       imap <buffer><c-n>   <Plug>(unite_select_next_line)
       inoremap <silent><buffer><expr> <C-s>     unite#do_action('split')
       inoremap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
       " for toggling (show / hide)
       " imap <silent><buffer><c-l>   <esc>:bd<cr>
       imap <silent><buffer><c-p>   <esc>:bd<cr>
       imap <f3>                    <esc>:bd<cr>
    endfunction
    " custom mappings for the unite buffer
    autocmd FileType unite call s:unite_settings()

    " nnoremap <c-p> :Unite file file_rec -start-insert -vertical -direction=botright<cr>

    "nnoremap <Leader>r :<C-u>Unite -start-insert file_rec<cr>
    nnoremap <c-p> :Unite file file_rec buffer<cr>
    " nnoremap <c-l> :Unite line<cr>
    noremap <f3> :Unite file_mru<cr>
" }}}

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" ====================================================================
" Python
" ====================================================================
Plug 'fisadev/vim-isort'
" {{{
    " https://github.com/fisadev/vim-isort
    " sort python imports using isort
    " select a block of imports with visual mode, and press Ctrl-i to sort them
    " $ sudo pip2 install isort
    " $ sudo pip3 install isort
" }}}

" ====================================================================
" Tags
" ====================================================================
Plug 'majutsushi/tagbar'
" {{{
    " $ yaourt ctags
    nnoremap <F8> :TagbarToggle<cr>
" }}}

" ====================================================================
" Terminal
" ====================================================================
"Plug 'kassio/neoterm'
" {{{
    " https://github.com/kassio/neoterm
    " let g:neoterm_position = 'vertical'
" }}}

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath
" END
call plug#end()    " vim-plug

" https://github.com/junegunn/vim-plug/wiki/faq#loading-plugins-manually
" With `on` and `for` options, vim-plug allows you to defer loading of
" plugins. But if you want a plugin to be loaded on an event that is not
" supported by vim-plug, you can set `on` or `for` option to an empty list, and
" use `plug#load(names...)` function later to load the plugin manually. The
" following example will load ultisnips and YouCompleteMe first time you
" enter insert mode.
augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END

" these unite lines must be here, after vim-plug, otherwise vim drops an error when launched
" https://github.com/Shougo/neobundle.vim/issues/330
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#profile('default', 'context', {
\   'prompt': '» ',
\   'start_insert': 1,
\   'vertical': 1,
\   'direction': 'botright',
\   'ignorecase': 1
\ })

" =================================================================================

set nowrap

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set scrolloff=2    " Show 2 lines of context around the cursor.
set nostartofline
" ^^^ When 'on' the jump commands move the cursor to the first non-blank
" of the line.  When off the cursor is kept in the same column (if possible).

" mouse {{{
    set mouse=a
" "}}}

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" don't change TABs in makefiles
autocmd FileType make set noexpandtab

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c  formatoptions-=r formatoptions-=o

" highlight the current line
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" color scheme
if filereadable($HOME."/LIGHT_BACKGROUND")
    set background=light
    "colorscheme trivial256
    "colorscheme emacs
    colorscheme emacs_jabba
    hi LineNr       term=bold cterm=bold ctermfg=2 guifg=Grey guibg=Grey90
    hi CursorLine   guibg=#DBE6E0
    hi NonText      guifg=Blue guibg=none gui=none
    "hi Normal       guifg=Black guibg=#FEFEDC
    "hi CursorLine   guibg=lightcyan
    "hi LineNr       term=bold cterm=bold ctermfg=2 guifg=Grey guibg=LightCyan
    " type :hi to see some color combinations (if you want to change the color
    " of the line numbers)
else
    set background=dark
    " {{{
        colorscheme kalisi
        " black background:
        hi Normal   guifg=#d0d0d0 guibg=Black  gui=none
        " black background at the end of file too (with lines ~):
        hi NonText  guifg=#958b7f guibg=Black gui=none
    " }}}
    "colorscheme advantage
    "colorscheme elflord
    hi LineNr       term=bold cterm=bold ctermfg=2 guifg=DarkGrey guibg=#334C75
    "hi LineNr       term=bold cterm=bold ctermfg=2 guifg=Grey
    "guibg=Grey90
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
    nnoremap xr   :r $HOME/.vimxfer<cr>
    nnoremap xR   :-r $HOME/.vimxfer<cr>
    nnoremap xw   :'a,.w! $HOME/.vimxfer<cr>
    vnoremap xr   c<esc>:r $HOME/.vimxfer<cr>
    vnoremap xR   c<esc>:-r $HOME/.vimxfer<cr>
    vnoremap xw   :w! $HOME/.vimxfer<cr>
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

" use system clipboard
set clipboard+=unnamedplus

"VimTip 305: Best of VIM Tips (VIM's best Features)
"MAKE IT EASY TO UPDATE/RELOAD_vimrc
"src: source rc file
"erc: edit rc file
nnoremap <Leader>src :source $MYVIMRC<cr>
nnoremap <Leader>erc :vsplit $MYVIMRC<cr>

" close (kill) window / buffer
" {{{
    " If you are in a split window, Ctrl-k closes the window.
    " If there is only one window (no split), Ctrl-k closes the current buffer.
    " This way you don't need to memorize two shortcuts for each operation.
    function! CloseWindowOrBuffer()
        if winnr('$') > 1    " there is more than one window, i.e. there is a split
            call feedkeys("\<c-w>q")
        else
            call feedkeys(":bd\<cr>")
        endif
    endfunction

    nnoremap <c-k> :call CloseWindowOrBuffer()<cr>
    inoremap <c-k> <Esc>:call CloseWindowOrBuffer()<cr>
" }}}

" split / buffers / windows {{{
    noremap <c-x>\| :vsplit<cr>
    noremap <c-x>\ :vsplit<cr>
    noremap <c-x>/ :vsplit<cr>
    noremap <c-x>- :split<cr>
    noremap <c-x>3 :vsplit<cr>
    noremap <c-x>1 :only<cr>
    " Ctrl-l is clear screen in bash but Ctrl-l was taken
    " so Alt-l is chosen to 'clear' the screen, i.e. keep the current window only
    nnoremap <A-l> :only<cr>
    " maximize the current window
    noremap <f11>    <c-w>_
" }}}

" save current file
noremap <c-x><c-s> <ESC>:w<cr>
inoremap <c-x><c-s> <ESC>:w<cr>i

"############################################################################
"#  START: Jabba's own config :)
"############################################################################

"this way Y is more logical
noremap Y y$

"VimTip 224: Shifting blocks visually
vnoremap < <gv
vnoremap > >gv

"############################################################################
"#  Function keys
"############################################################################

"switch spell check on/off (grammar check)
setlocal spell spelllang=en_us      "let's use English by default
set nospell                         "by default spell is off

"change wrap
noremap <F6> :set wrap!<cr>

"change number
noremap <F7> :set number!<cr>

"quit
noremap <F10> :q<cr>

"############################################################################
"#  Navigation / Windows
"############################################################################

" centre the screen on the current search result
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" tip: re-position the current line
" zt  -> zoom to top
" zz  -> zoom to center
" zb  -> zoom to bootm

"############################################################################
"#  other
"############################################################################

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
nnoremap l :set list!<cr>
" And set some nice chars to do it with
"set listchars=tab:»\ ,eol:¬
" automatically change window's cwd to file's dir
set autochdir

" remove trailing whitespaces {{{
    autocmd BufWritePre *.txt :%s/\s\+$//e
    autocmd BufWritePre *.py :%s/\s\+$//e
    autocmd BufWritePre *.md :%s/\s\+$//e
    autocmd BufWritePre *.h :%s/\s\+$//e
    autocmd BufWritePre *.tex :%s/\s\+$//e
    autocmd BufWritePre *.vim :%s/\s\+$//e
" }}}

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
    " tnoremap <A-h> <C-\><C-n><C-w>h
    " tnoremap <A-j> <C-\><C-n><C-w>j
    " tnoremap <A-k> <C-\><C-n><C-w>k
    " tnoremap <A-l> <C-\><C-n><C-w>l
    " nnoremap <A-h> <C-w>h
    " nnoremap <A-j> <C-w>j
    " nnoremap <A-k> <C-w>k
    " nnoremap <A-l> <C-w>l
" }}}

" terminal {{{
    nnoremap <c-x>t :vsplit<cr>:term<cr>
    nnoremap <c-x>T :split<cr>:term<cr>

    function! Terminal(params)
        call feedkeys(":vsplit\<cr>:term\<cr>")
        call feedkeys(a:params . "\<cr>")
    endfunction

    " :T cmd    -> open the cmd command in the terminal, e.g. :T mc    -> open mc
    command! -nargs=1 T call Terminal(<f-args>)
" }}}

" close window
nnoremap <c-q> <c-w>q

"VimTip 163: Toggle Search Highlighting {{{
    nnoremap <Leader>h :set cursorline! hlsearch!<cr>
"}}}

" scroll in the 'background' {{{
    " the cursor remains in the center and the text scrolls up/down
    noremap <s-up>   kzz
    noremap <s-down> jzz
" }}}

" This makes the cursor a pipe in insert-mode, and a block in normal-mode.
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Avoid scrolling when switch buffers {{{
" tip from romainl on IRC #vim
augroup save_and_restore_buffer
    autocmd!
    autocmd BufLeave * let b:winview = winsaveview()
    autocmd BufEnter * if exists('b:winview') | call winrestview(b:winview) | endif
augroup END
" }}}

" trial and error
" uppercase the current word
" imap <c-u> <esc><right>viwUi
" map <c-u> viwU

" Google with (or without) search {{{
    function! Google(params)
        " echo a:params
        let url = "http://www.google.com/search?q=" . a:params
        exec 'silent !xdg-open "' . url . '"'
    endfunction

    " :Go search_term    -> google lookup of the search term
    command! -nargs=1 Go call Google(<f-args>)

    " :Google    -> open Google's search page
    command! Google exec 'silent !xdg-open http://www.google.com'
" }}}

" python << EOF
" print "hello python"
" EOF

" {{{
    function! CenterCursor()
        call feedkeys("zz")    " emulate these keypresses: zz (center line)
    endfunction

    " autocmd BufReadPre,FileReadPre * call CenterCursor()
" }}}

" filename / dirname of the current file {{{
    " copy result to the system clipboard and echo the result
    " the cb> prompt means the clipboard
    " *f*ile *n*ame, ex. init.vim
    nnoremap <Leader>fn :let @+ = expand("%:t") \| echo 'cb> ' . @+<cr>
    " *f*ile *p*ath, ex. /home/user/nvim/init.vim
    nnoremap <Leader>fp :let @+ = expand("%:p") \| echo 'cb> ' . @+<cr>
    " *d*irectory *p*ath, ex. /home/user/nvim
    nnoremap <Leader>dp :let @+ = expand("%:p:h") \| echo 'cb> ' . @+<cr>
    " *d*irectory *n*ame, ex. nvim
    nnoremap <Leader>dn :let @+ = expand("%:p:h:t") \| echo 'cb> ' . @+<cr>
" }}}

" {{{
    " from http://stackoverflow.com/a/9459366/232485
    function! HandleURL()
      let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
      echo s:uri
      if s:uri != ""
        silent exec "!xdg-open '" . s:uri . "'"
      else
        echo "no URI found in line"
      endif
    endfunction

    nnoremap <Leader>u :call HandleURL()<cr>
" }}}

" some abbreviations {{{
    iabbrev tubi    https://ubuntuincident.wordpress.com/
    iabbrev pyadv   https://pythonadventures.wordpress.com/
" }}}
