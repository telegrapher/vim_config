set nocompatible              " be iMproved, required
set encoding=utf-8            " required by YouCompleteMe

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plug picks plugins from the old Vundle directory
call plug#begin('~/.vim/bundle/')

" Reminder of vim-plug usage
" Plug 'junegunn/vim-plug'
Plug 'powerline/powerline'                              " Advanced powerline

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'                              " NERDTree file browser
Plug 'scrooloose/syntastic'                             " Syntax checker
Plug 'tpope/vim-fugitive'                               " Git integration
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'                               " Advanced search
Plug 'csexton/trailertrash.vim'                         " Trailing spaces
Plug 'elzr/vim-json'                                    " JSON
Plug 'GutenYe/json5.vim'                                " JSON5
Plug 'pedrohdz/vim-yaml-folds'                          " Improve vim folding

Plug 'rodjek/vim-puppet'                                " Puppet language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}       " Go support

Plug 'vim-scripts/wombat256.vim'                        " Color profile
Plug 'nanotech/jellybeans.vim'                          " Color profile
Plug 'morhetz/gruvbox'                                  " Color profile
Plug 'w0ng/vim-hybrid'                                  " Color profile
Plug 'sjl/badwolf'                                      " Color profile
Plug 'chriskempson/base16'                              " Color profile
Plug 'chriskempson/tomorrow-theme'                      " Color profile
Plug 'zeis/vim-kolor'                                   " Color profile

call plug#end()            " required
" To ignore plugin indent changes, instead use:
"
" Brief help
" :PlugInstall
" :PlugUpdate
"
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
"nnoremap <C-j> <C-W><C-J>
"nnoremap <C-k> <C-W><C-K>
"nnoremap <C-l> <C-W><C-L>
"nnoremap <C-h> <C-W><C-H>

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

" Bash script, needs shellcheck installed in the machine
let g:syntastic_sh_shellcheck_args="-x -o all"
let g:syntastic_sh_checkers=['shellcheck']

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
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Hightligth all instances of current variable
let g:go_auto_sameids = 1

" Show variable types
let g:go_auto_type_info = 1

" Stop resetting folding at file save
let g:go_fmt_experimental = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Folding
" zc close zo open za toggle
" zC and ZO affect recursively
" zR open all zM close all
set foldmethod=syntax

" Tabs gt, gT 1gt
" t open tab in nerdtree
" T open tab in bg

" Try netrw using Nerdtree
let NerdTreeHijackNetrw=1

