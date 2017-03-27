"                                _
"                               (_)
"          _ __   ___  _____   ___ _ __ ___
"         | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"         | | | |  __/ (_) \ V /| | | | | | |
"         |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
"
" NeoVim config file of Jabba Laci (jabba.laci@gmail.com)
" last change: 2016.05.25. (yyyy.mm.dd.)
" repo: https://github.com/jabbalaci/dotfiles/blob/master/nvim/init.vim
"
" Place of this configuration file:
"   ~/.config/nvim/init.vim
"
" F1:    NERDTreeToggleAndFind() [show current file]
" F2:    NERDTreeToggle()
" F3:    Unite file_mru
" F4:    toggle tagbar
" F5:    :Autoformat
" F6:    toggle wrap
" F7:    toggle number
" F8:    close empty buffers
" F9:    run with Python (taking the interpreter from the first line)
" F10:   --
" F11:   maximize window
" F12:   yakuake [outside of neovim]
"
" HQ:
"   * https://neovim.io
"   * https://neovim.io/news/archive/ (news)
" Docs:
"   * https://neovim.io/doc/user/ (from basic to advanced)
"   * :h nvim
" Most recent (bleedind edge) info on commits:
"   * https://github.com/neovim/neovim/wiki/Following-HEAD
" Installation (Ubuntu):
"   The HQ suggests a PPA that contains the development version:
"     * https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu
"   If you want to build Neovim from source, here are the steps:
"   1) Visit https://github.com/neovim/neovim and find the tagged version you need.
"      Download the zip, uncompress it, and enter the project folder.
"   2) Install the dependencies:
"      $ sudo apt-get install libtool autoconf automake cmake libncurses5-dev g++
"      Note: cmake is needed for YCM too.
"   3) $ make cmake
"      $ make test
"      $ sudo make install
"   On all platforms (update this package frequently):
"     $ sudo pip2/pip3 install neovim -U
" Links:
"   * http://vimcasts.org/ (vimcasts contains 68 free screencasts and 47 articles)
"   * http://vimawesome.com/ (list of awesome plugins)
"   * http://vim.spf13.com/ (it can give you ideas of must-have plugins)
"   * https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
"   * https://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
" Notes:
"   * nvim --startuptime nvim.log    -> check what makes it slow to load
"   * :map H    -> What is mapped on H ?
"   * :verb set expandtab?    -> if expandtab is not OK, then find out who changed it for the last time (verbose)
"   * :set ft=json    -> treat the file as a json file (even if it has a different extension) [ft: filetype]
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
"   :edit             -> reload the current file (if it was changed outside of vim)
"
" Help:
"   :h help-context    -> v_ (visual mode commands), etc.
"   :h i_CTRL-Y        -> What does Ctrl-y do in insert mode?
"
" Windows:
"   Ctrl+w =           -> equal size
"   Ctrl+w _           -> maximize window's height (my map: F11)
"
" Moving:
"   reposition the current line:
"     zt  -> zoom to top
"     zz  -> zoom to center
"     zb  -> zoom to bottom
"
" Variables:
"                   (nothing) In a function: local to a function; otherwise: global
"   |buffer-variable|    b:   Local to the current buffer.
"   |window-variable|    w:   Local to the current window.
"   |tabpage-variable|   t:   Local to the current tab page.
"   |global-variable|    g:   Global.
"   |local-variable|     l:   Local to a function.
"   |script-variable|    s:   Local to a |:source|'ed Vim script.
"   |function-argument|  a:   Function argument (only inside a function).
"   |vim-variable|       v:   Global, predefined by Vim.
"

" create the required directories {{{
    silent !mkdir ~/nvim.local > /dev/null 2>&1
    silent !mkdir ~/nvim.local/tmp > /dev/null 2>&1
    silent !mkdir ~/nvim.local/undo > /dev/null 2>&1
" }}}

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

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
    " $ sudo pip3 install neovim-remote -U
" }}}

" ====================================================================
" Color schemes
" ====================================================================
Plug 'freeo/vim-kalisi'

Plug 'junegunn/seoul256.vim'
" {{{
    " https://github.com/junegunn/seoul256.vim
" }}}

" ====================================================================
" Visuals
" ====================================================================
" Plug 'nathanaelkane/vim-indent-guides'
" " {{{
"     " :h indent-guide
"     " <Leader>ig    -> toggle indent guide on/off
"     let g:indent_guides_enable_on_vim_startup = 0
" " }}}

Plug 'Yggdroot/indentLine'
" {{{
    " :h indentLine.txt
    let g:indentLine_char = '¦'
    "
    " let g:indentLine_char = '┆'
    "
    " let g:indentLine_char = '┊'
    "
    " let g:indentLine_char = '│'
    " disable it
    let g:indentLine_enabled = 1
    " the indentlines will not show up in the cursorline:
    let g:indentLine_concealcursor = ''
    " When I enter insert mode, UltiSnips and YCM are loaded. At that
    " moment the indent lines disappear :( With F5 I can bring them
    " back. For the first time, F5 must be pressed twice, then it
    " toggles the indent lines correctly.
    " nnoremap <F5>  :IndentLinesToggle<cr>
    " let g:indentLine_conceallevel = 0
"}}}

Plug 'elzr/vim-json'
" {{{
    " https://github.com/elzr/vim-json
    " indentLine conceals quotes in json files; this puts them back:
    let g:vim_json_syntax_conceal = 0
" }}}

if filereadable($HOME . "/LIGHT_BACKGROUND")
    Plug 'jabbalaci/python-syntax'
    " {{{
        " https://github.com/hdima/python-syntax
        " better Python syntax highlighting
        let python_highlight_all = 1
        let python_highlight_string_format = 0
        let python_highlight_space_errors = 0
        " let python_highlight_file_headers_as_comments = 1
    " }}}

    Plug 'jabbalaci/vim-operator-highlight'
    " {{{
        " https://github.com/Valloric/vim-operator-highlight
        let g:ophigh_color_gui = "#7382d0"
    " }}}
endif

" ====================================================================
" Completion
" ====================================================================
Plug 'Raimondi/delimitMate'
" {{{
    " This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
    " We also need this plugin in a workaround below, which requires this plugin.
    " set matchpairs+=<:>         " show matching <> (html mainly) as well
    " !!! when specifying several file types, there is NO space between them !!!
    autocmd FileType html,vim set matchpairs+=<:>
" }}}

Plug 'valloric/MatchTagAlways'
" {{{
    " https://github.com/valloric/MatchTagAlways
    " highlight the XML/HTML tags that enclose your cursor location
" }}}

" Plug 'SirVer/ultisnips', { 'on': [] } | Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" {{{
    " :UltiSnipsEdit    -> edit the custom snippet file of the current filetype
    " a bit slow, it will be loaded when the editor started
    " Group dependencies, vim-snippets depends on ultisnips
    " to avoid TAB confusion between UltiSnips and YouCompleteMe
    let g:UltiSnipsExpandTrigger="<C-Space>"
    let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
" }}}

" Autocompletion for Python and C-like languages {{{
  " from here: https://github.com/euclio/vimrc/blob/master/plugins.vim
  " Under Manjaro 64-bit I had a problem with the automatic installation, YCM
  " didn't start, libtinfo.so.5 caused an import error for Python.
  " I found the solution here: https://github.com/Valloric/YouCompleteMe/issues/778
  " Steps to follow (Manjaro 64 bit):
  " $ sudo pacman-key --refresh-keys
  " $ gpg --keyserver pgp.mit.edu --recv-keys C52048C0C0748FEE227D47A2702353E0F7E48EDB
  " $ yaourt -S libtinfo-5
  if has('python') && executable('python') && executable('cmake')
    function! g:BuildYCM(info)
      if a:info.status ==# 'installed' || a:info.force
        " compiling YCM with semantic support for C-family languages:
        let flags = ['--clang-completer']
        " JavaScript support:
        if executable('npm')
          call extend(flags, ['--tern-completer'])
        endif
        exec '!python ./install.py ' . join(flags)
      endif
    endfunction

    " Plug 'Valloric/YouCompleteMe', { 'on': [], 'do': function('BuildYCM') }
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    " a bit slow, it will be loaded when the editor started
    let g:ycm_autoclose_preview_window_after_completion=1
    " no preview window {{{
        let g:ycm_add_preview_to_completeopt = 0
        set completeopt-=preview
    " }}}
    nnoremap <Leader>g  :YcmCompleter GoToDefinitionElseDeclaration<cr>

    let g:ycm_confirm_extra_conf=0          " Disable .ycm_extra_conf confirmation
    let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"
    let g:EclimCompletionMethod='omnifunc'  " Let YCM use Eclipse autocomplete

    " disable TAB in the popup, allowing UltiSnip to work with TAB
    "let g:ycm_key_list_select_completion=[]
    "let g:ycm_key_list_previous_completion=[]

    " A workaround: when the YCM popup appears and you select a hint, you can
    " press Enter to close the popup. This behaviour is similar to other editors.
    imap <expr> <cr> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

    " let g:ycm_python_binary_path = '/usr/bin/python3'
    " let g:ycm_server_python_interpreter = '/usr/bin/python3'

    " if s:has_arch
       " Force YCM to use a Python 3 interpreter
       " let g:ycm_server_python_interpreter='/usr/bin/python3'
     " endif
  endif
" }}}

" " deoplete, a YouCompleteMe alternative {{{
"     function! DoRemote(arg)
"       UpdateRemotePlugins
"     endfunction
"     Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
"
"     let g:deoplete#enable_at_startup = 1
"     let g:deoplete#enable_smart_case = 1
" " }}}

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

let linux_distro = system("cat /etc/os-release | grep '^ID=' | cut -d= -f2")
if linux_distro == "manjaro\n"
    " under ubuntu I had problems with the YCM / jedi-vim combo :(
    " let's disable jedi-vim on ubuntu
    Plug 'davidhalter/jedi-vim'
    " " {{{
    "     " :h jedi-vim
    "     " use YCM for code completion
        " let g:jedi#completions_enabled = 0
        " let g:jedi#auto_initialization = 0
        " it is Ctrl+Space by default, but we need that in ultisnip, so remap it to something else
        let g:jedi#completions_command = "<A-Space>"
        " with version 2 I had problems:
        let g:jedi#force_py_version=3
        " let g:auto_vim_configuration = 0
        " let g:popup_on_dot = 0
    " " }}}
endif

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
    " Ctrl-/    -> also works but press it twice
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
" Git
" ====================================================================
"Plug 'tpope/vim-fugitive'
" {{{
" }}}

Plug 'airblade/vim-gitgutter'
" {{{
" }}}

Plug 'Xuyuanp/nerdtree-git-plugin'
" {{{
" }}}

" ====================================================================
" Syntax
" ====================================================================
Plug 'neomake/neomake'
" {{{
    " neomake is async => it doesn't block the editor
    " It's a syntastic alternative. Syntastic was slow for me on python files.
    " $ sudo pip2/pip3 install flake8 -U
    " $ sudo pip2/pip3 install vulture -U
    let g:neomake_python_enabled_makers = ['flake8', 'pep8', 'vulture']
    " let g:neomake_python_enabled_makers = ['flake8', 'pep8']
    " E501 is line length of 80 characters
    let g:neomake_python_flake8_maker = { 'args': ['--ignore=E115,E266,E501,E302'], }
    let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=100', '--ignore=E115,E266,E302'], }

    " I had a problem under Manjaro: problems were underlined, instead of coloring red
    let distro = system("cat /etc/issue | head -1 | cut -f 1 -d ' '")
    if distro == "Manjaro\n"
        let g:neomake_highlight_columns = 0
    endif

    " run neomake on the current file on every write:
    autocmd! BufWritePost * Neomake
" }}}

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
    " let distro = system("cat /etc/issue | head -1 | cut -f 1 -d ' '")
    " if distro == "Manjaro\n"
    "     set termguicolors
    " else
    "     " Ubuntu
    "     set termguicolors
    "     " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
    " endif
    set termguicolors
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
    " noremap <c-b><c-n> :bnext<cr>
    noremap <C-PageDown> :bnext<cr>
    inoremap <C-PageDown> <esc>:bnext<cr>
    noremap <C-right> :bnext<cr>
    inoremap <C-right> <esc>:bnext<cr>
    " noremap <c-b><c-b> :bprevious<cr>
    noremap <C-PageUp> :bprevious<cr>
    inoremap <C-PageUp> <esc>:bprevious<cr>
    noremap <C-left> :bprevious<cr>
    inoremap <C-left> <esc>:bprevious<cr>

    nnoremap <Leader>c :enew<cr>
    " switch buffers even if the buffer was not saved:
    set hidden
" }}}

" ====================================================================
" Buffers
" ====================================================================
Plug 'vim-scripts/BufOnly.vim'
" {{{
    " :BufOnly closes all buffers except the current one
" }}}

" ====================================================================
" Formatter
" ====================================================================
Plug 'Chiel92/vim-autoformat'
" {{{
    " https://github.com/Chiel92/vim-autoformat
    " Usage:
    "   1) :Autoformat    -> entire file
    "   2) select a region and then :Autoformat    -> format just the region
    " for json, html, css, javascript:
    "   $ sudo npm install -g js-beautify
    noremap <F5> :Autoformat<cr>
" }}}

Plug 'avakhov/vim-yaml'
" {{{
    " https://github.com/avakhov/vim-yaml
    " indent yaml
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
       imap <F3>                    <esc>:bd<cr>
    endfunction
    " custom mappings for the unite buffer
    autocmd FileType unite call s:unite_settings()

    " nnoremap <c-p> :Unite file file_rec -start-insert -vertical -direction=botright<cr>

    "nnoremap <Leader>r :<C-u>Unite -start-insert file_rec<cr>
    nnoremap <c-p> :Unite file file_rec buffer<cr>
    " nnoremap <c-l> :Unite line<cr>
    noremap <F3> :Unite file_mru<cr>
" }}}

" ====================================================================
" Python
" ====================================================================
Plug 'fisadev/vim-isort'
" {{{
    " https://github.com/fisadev/vim-isort
    " $ sudo pip2/pip3 install isort -U
    " sort python imports using isort
    " select a block of imports with visual mode, and press Ctrl-i to sort them
" }}}

" ====================================================================
" Julia
" ====================================================================
Plug 'JuliaEditorSupport/julia-vim'
" {{{
    " Plug 'JuliaEditorSupport/julia-vim'
" }}}

" ====================================================================
" Scala
" ====================================================================
Plug 'derekwyatt/vim-scala'
" {{{
    " https://github.com/derekwyatt/vim-scala
" }}}

" ====================================================================
" Tags
" ====================================================================
Plug 'majutsushi/tagbar'
" {{{
    " $ yaourt ctags                  # Manjaro
    " $ sudo apt-get install ctags    # Ubuntu
    nnoremap <F4> :TagbarToggle<cr>
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

" ====================================================================
" Rust
" ====================================================================
Plug 'rust-lang/rust.vim'
" {{{
    " https://github.com/rust-lang/rust.vim
" }}}

" ====================================================================
" Markdown
" ====================================================================
" Plug 'suan/vim-instant-markdown'
" doesn't work with neovim (yet), see https://github.com/suan/vim-instant-markdown/issues/110
" " {{{
"     " https://github.com/suan/vim-instant-markdown
"     let g:instant_markdown_autostart = 0
"     map <Leader>md :InstantMarkdownPreview<CR>
" " }}}

call plug#end()    " vim-plug

" https://github.com/junegunn/vim-plug/wiki/faq#loading-plugins-manually
" With `on` and `for` options, vim-plug allows you to defer loading of
" plugins. But if you want a plugin to be loaded on an event that is not
" supported by vim-plug, you can set `on` or `for` option to an empty list, and
" use `plug#load(names...)` function later to load the plugin manually. The
" following example will load ultisnips and YouCompleteMe first time you
" enter insert mode.
" Note: it saved me a sec. but it caused some problems, so I took it out
" augroup load_us_ycm
"   autocmd!
"   autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
"                      \| call youcompleteme#Enable() | autocmd! load_us_ycm
" augroup END

" these unite lines must be here, after vim-plug, otherwise vim drops an error when launched
" https://github.com/Shougo/neobundle.vim/issues/330
" {{{
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#custom#profile('default', 'context', {
    \   'prompt': '» ',
    \   'start_insert': 1,
    \   'vertical': 1,
    \   'direction': 'botright',
    \   'ignorecase': 1
    \ })
" }}}

" =================================================================================

set nowrap
set ttimeout
set ttimeoutlen=100

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set scrolloff=2    " Show 2 lines of context around the cursor.
set nostartofline
" ^^^ When 'on' the jump commands move the cursor to the first non-blank
" of the line.  When off the cursor is kept in the same column (if possible).

" movements {{{
    " top, middle, bottom
    nnoremap tt H
    nnoremap mm M
    nnoremap bb L

    " beginning of line, end of line (non-blank in both cases)
    nnoremap aa ^
    nnoremap zz g_
    " |    -> 1st column (blank)
    " \\   -> last char (blank)
    nnoremap \\ $
" }}}

" mouse {{{
    set mouse=a

    function! ToggleMouse()
      if &mouse == "a"
        set mouse=
        echo 'copy with mouse: ✔'
        set nonumber
      else
        set mouse=a
        echo 'copy with mouse: ✘'
        set number
      endif
    endfunction

    " Ctrl-m also affects <cr> !!!,
    " so in Vim you can't map Ctrl-m
    noremap M :call ToggleMouse()<cr>
" "}}}

au BufNewFile,BufRead *.js set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.html set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.css set tabstop=2 softtabstop=2 shiftwidth=2

" don't change TABs in makefiles
autocmd FileType make set noexpandtab

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c  formatoptions-=r formatoptions-=o

" highlight the current line {{{
    set cursorline
    autocmd WinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
" }}}

" color scheme
if filereadable($HOME . "/LIGHT_BACKGROUND")
    set background=light
    " colorscheme trivial256_jabba
    " colorscheme emacs
    " colorscheme emacs_jabba
    colorscheme jabba
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
    set backupdir=~/nvim.local/tmp
    set directory=~/nvim.local/tmp

    " let's add undo
    set undofile
    set undodir=~/nvim.local/undo
" }}}

" when re-opening a file, jump back to the previous position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" use system clipboard
set clipboard+=unnamedplus

" VimTip 305: make it easy to update/reload .vimrc {{{
    "src: source rc file
    "erc: edit rc file
    nnoremap <Leader>src :source $MYVIMRC<cr>
    nnoremap <Leader>erc :e $MYVIMRC<cr>
    " nnoremap <Leader>erc :vsplit $MYVIMRC<cr>
" }}}

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
    " maximize the current window (highest possible, then widest possible)
    " vertical to horizontal ( | -> -- )
    noremap <c-w>-  <c-w>t<c-w>K
    " horizontal to vertical ( -- -> | )
    noremap <c-w>\|  <c-w>t<c-w>H
    noremap <c-w>\  <c-w>t<c-w>H
    noremap <c-w>/  <c-w>t<c-w>H
    "noremap <F11>    <c-w>_<c-w>\|
    function! ToggleWindow()
      if exists("w:maximized")
          call feedkeys("\<c-w>=", "n")
          unlet w:maximized
      else
          call feedkeys("\<c-w>_\<c-w>\|", "n")
          let w:maximized = 1
      endif
    endfunction
    noremap <F11>  :call ToggleWindow()<cr>
" }}}

" save current file {{{
    noremap <c-x><c-s> <ESC>:w<cr>
    inoremap <c-x><c-s> <ESC>:w<cr>i
" }}}

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

"############################################################################
"#  other
"############################################################################

" don't outdent hashes
inoremap # #

"====[ Make the 81st column stand out ]==================== {{{
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%101v', 100)    " I set it to 100
    " call matchadd('ColorColumn', '\%121v', 100)   " column 120
    "call matchadd('ColorColumn', '\%81v', 100)    " column 80
" }}}

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]====== {{{
    exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    set list
" }}}

" (http://unlogic.co.uk/posts/vim-python-ide.html)
" Use l to toggle display of whitespace
nnoremap <Leader>l :set list!<cr>
" And set some nice chars to do it with
"set listchars=tab:»\ ,eol:¬
" automatically change window's cwd to file's dir
set autochdir

" remove trailing whitespaces, strip, trim {{{
    autocmd BufWritePre *.txt :%s/\s\+$//e
    autocmd BufWritePre *.py :%s/\s\+$//e
    autocmd BufWritePre *.scala :%s/\s\+$//e
    autocmd BufWritePre *.pl :%s/\s\+$//e
    autocmd BufWritePre *.php :%s/\s\+$//e
    autocmd BufWritePre *.java :%s/\s\+$//e
    autocmd BufWritePre *.md :%s/\s\+$//e
    autocmd BufWritePre *.h :%s/\s\+$//e
    autocmd BufWritePre *.tex :%s/\s\+$//e
    autocmd BufWritePre *.vim :%s/\s\+$//e
    autocmd BufWritePre *.nfo :%s/\s\+$//e
    autocmd BufWritePre *.json :%s/\s\+$//e
    autocmd BufWritePre *.rs :%s/\s\+$//e
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

    nnoremap <c-x>t :vsplit<cr>:term<cr>
    nnoremap <c-x>T :split<cr>:term<cr>

    function! Terminal(params)
        call feedkeys(":vsplit\<cr>:term\<cr>")
        call feedkeys(a:params . "\<cr>")
    endfunction

    " :T cmd    -> open the cmd command in the terminal, e.g. :T mc    -> open mc
    command! -nargs=1 T call Terminal(<f-args>)
" }}}

" centre the screen on the current search result {{{
    "nnoremap n nzz
    "nnoremap N Nzz
    " nnoremap * *zz
    " nnoremap # #zz
    " nnoremap g* g*zz
    " nnoremap g# g#zz
" }}}

"scroll half page left (CTRL-B) / right (CTRL-J) {{{
    noremap  <c-b> zH
    noremap! <c-b> zH
    noremap  <c-j> zL
    noremap! <c-j> zL
" }}}

"VimTip 38: Cursor one line at a time when :set wrap {{{
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk
    nnoremap <Down> gj
    nnoremap <Up> gk
    vnoremap <Down> gj
    vnoremap <Up> gk
    inoremap <Down> <C-o>gj
" }}}

" close window
nnoremap <c-q> <c-w>q

"VimTip 163: Toggle Search Highlighting {{{
    " nnoremap <Leader>h :set cursorline! hlsearch!<cr>
    nnoremap H :set cursorline! hlsearch!<cr>
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
    " command! Google exec 'silent !xdg-open http://www.google.com'
" }}}

" Firefox bookmarks (works with other browsers too) {{{
    function! Firefox(params)
        let d = {
        \ 'go': 'http://www.google.com',
        \ 'wp': 'https://en.wikipedia.org',
        \ 'red': 'http://www.reddit.com',
        \ 'py': 'http://www.reddit.com/r/python',
        \ 'prog': 'http://www.reddit.com/r/programming',
        \ 'vim': 'http://www.reddit.com/r/vim',
        \ 'nvim': 'http://www.reddit.com/r/neovim',
        \ 'hn': 'https://news.ycombinator.com',
        \ 'index': 'http://index.hu',
        \ 'hup': 'http://hup.hu',
        \ }
        if has_key(d, a:params)
            let url = d[a:params]
            exec 'silent !xdg-open "' . url . '"'
        else
            echo "bookmark not found"
      endif
    endfunction

    command! -nargs=1 FF call Firefox(<f-args>)
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
    " help
    nnoremap <Leader>path :echo 'cb help> fn: file name; fp: file path; dn: dir. name; dp: dir. path'<cr>
" }}}

" {{{
    " from http://stackoverflow.com/a/9459366/232485
    function! HandleURL()
      let uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
      echo uri
      if uri != ""
        silent exec "!xdg-open '" . uri . "'"
      else
        echo "no URI found in line"
      endif
    endfunction

    nnoremap <Leader>u :call HandleURL()<cr>
" }}}

" run python script {{{
    function! RunWithPython()
        let first = getline(1)
        let first = substitute(first, "^#!", "", "")
        let first = substitute(first, "\n", "", "")
        let exe = ""    " the Python binary to call

        if first =~ "/usr/bin/env "
            let exe = split(first)[-1]
        elseif first == "/opt/anaconda3/bin/python3"
            let exe = first
        endif
        if exe == ""
            echo "Error: unknown Python interpreter in the first line."
            return
        endif
        " echo exe
        echo system(exe . " " . expand('%'))
    endfunction

    " nnoremap <F9> :exec '!python2' shellescape(@%, 1)<cr>
    " nnoremap <F10> :exec '!python3' shellescape(@%, 1)<cr>
    " au FileType python nnoremap <buffer> <F9> :echo system('python2 "' . expand('%') . '"')<cr>
    " au FileType python nnoremap <buffer> <F10> :echo system('python3 "' . expand('%') . '"')<cr>
    " au FileType python nnoremap <buffer> <F10> :echo system('/opt/anaconda3/bin/python3 "' . expand('%') . '"')<cr>
    au FileType python nnoremap <buffer> <F9> :call RunWithPython()<cr>
" }}}

" some abbreviations {{{
    iabbrev tubi    https://ubuntuincident.wordpress.com/
    iabbrev pyadv   https://pythonadventures.wordpress.com/
" }}}

" " Hungarian accented characters {{{
"     " they don't work all the time :(
"     " árvíztűrő tükörfúrógép
"     " ÁRVÍZTŰRŐ TÜKÖRFÚRÓGÉP
"     iabbrev a' á
"     iabbrev e' é
"     iabbrev i' í
"     iabbrev o' ó
"     iabbrev o: ö
"     iabbrev o" ő
"     iabbrev u' ú
"     iabbrev u: ü
"     iabbrev u" ű
"
"     iabbrev A' Á
"     iabbrev E' É
"     iabbrev I' Í
"     iabbrev O' Ó
"     iabbrev O: Ö
"     iabbrev O" Ő
"     iabbrev U' Ú
"     iabbrev U: Ü
"     iabbrev U" Ű
" " }}}

" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi

" close empty buffers {{{
    " tip from http://stackoverflow.com/a/6561076/232485
    function! NrBufs()
        let i = bufnr('$')
        let j = 0
        while i >= 1
            if buflisted(i)
                let j+=1
            endif
            let i-=1
        endwhile
        return j
    endfunction

    function! CloseEmptyBuffers()
        if NrBufs() == 1
            return
        endif
        let [i, n; empty] = [1, bufnr('$')]
        while i <= n
            if bufexists(i) && bufname(i) == ''
                call add(empty, i)
            endif
            let i += 1
        endwhile
        if len(empty) > 0
            exe 'bdelete' join(empty)
        endif
    endfunction

    nnoremap <F8> :call CloseEmptyBuffers()<cr>
" }}}
