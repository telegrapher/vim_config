set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8            " required by YouCompleteMe
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'valloric/YouCompleteMe'             " Advanced completion
Plugin 'powerline/powerline'                " Advanced powerline

Plugin 'scrooloose/nerdtree'                " NERDTree file browser
Plugin 'scrooloose/syntastic'               " Syntax checker
Plugin 'tpope/vim-fugitive'                 " Git integration
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'                 " Advanced search
Plugin 'csexton/trailertrash.vim'           " Trailing spaces
Plugin 'elzr/vim-json'                      " JSON
Plugin 'GutenYe/json5.vim'                  " JSON5

Plugin 'rodjek/vim-puppet'                  " Puppet language support
Plugin 'fatih/vim-go'                       " Go support

Plugin 'vim-scripts/wombat256.vim'          " Color profile
Plugin 'nanotech/jellybeans.vim'            " Color profile
Plugin 'morhetz/gruvbox'                    " Color profile
Plugin 'w0ng/vim-hybrid'                    " Color profile
Plugin 'sjl/badwolf'                        " Color profile
Plugin 'chriskempson/base16'                " Color profile
Plugin 'chriskempson/tomorrow-theme'        " Color profile
Plugin 'zeis/vim-kolor'                     " Color profile

" Vunde help I keep pasted here, useful when I edit the .vimrc file
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Nerdtree configuration
if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    " Open NERDTree automatically in gvim
    autocmd VimEnter * NERDTree
else
    " Open NERDTree automatically when :gui is run
    autocmd GUIEnter * NERDTree
    " Open NERDTree only if no file has been passed to vim
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
endif
" Ctrl+n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Color configuration
set t_CO=256
set background=dark
colorscheme wombat256mod

" Syntax highlighting
syntax enable

" Show line numbers
set number

" Set autoindent
set autoindent

" Set tabs to 4 spaces
set tabstop=4

" Expand tabs into spaces
set expandtab

" When using >> or << shift lines by 4 spaces
set shiftwidth=4

" Show a line under the cursor's current line
" set cursorline

" Show the matching part for [] {} and ()
set showmatch

" Defaults for new split buffers
set splitbelow
set splitright

" Easier movement between split buffers, this overwrites C+L(redraw)
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Incremental search and highlight results
set incsearch
set hlsearch

" Remap Ctrl+L to delete highlight + redraw
" nnoremap <silent> <C-l> :noh<return><C-l>
" Since C+L is used, let's remap to C+\.
nnoremap <C-\> :execute 'noh \| redraw'<cr>

set guifont=Fantasque\ Sans\ Mono\ 13

":let g:airline_theme='base16_default'
:let g:airline_theme='raven'

" Set gvim size at start
if has('gui_running')
    set lines=80 columns=250
endif

" Make vim use the standard clipboard
set clipboard=unnamedplus

" Avoid auto-concealing in JSON files
let g:vim_json_syntax_conceal = 0

" Go specific changes
let mapleader=","
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>i <Plug>(go-install)

" No need to save before building with GoBuild
set autowrite

" Extra hightlights for Go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Hightligth all instances of current variable
let g:go_auto_sameids = 1

" Show variable types
let g:go_auto_type_info = 1

" Folding
" zc close zo open za toggle
" zC and ZO affect recursively
" zR open all zM close all
set foldmethod=syntax


