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

" Vim-Plug
" https://github.com/junegunn/vim-plug
let s:vim_plug_dir=expand($HOME.'/.config/nvim/autoload')
if !filereadable(s:vim_plug_dir.'/plug.vim')
    execute '!wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P '.s:vim_plug_dir
    let s:install_plug=1
endif

call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" https://github.com/vim-airline/vim-airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" https://github.com/hkupty/nvimux
Plug 'hkupty/nvimux'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath
call plug#end()

" =================================================================================

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

" AirLine settings
" also install the system package powerline-fonts
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'

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
map <c-b>- :split<CR>
map <c-b>\| :vsplit<CR>
map <c-x>\| :vsplit<CR>
map <c-x>- :split<CR>
map <c-x>3 :vsplit<CR>
map <c-x>1 :only<CR>
