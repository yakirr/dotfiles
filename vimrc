" Pathogen setup
execute pathogen#infect()

filetype plugin indent on

" vi? This is VIMMMMMMMMMMMMMM
set nocompatible

" all movement keys will move the the next line when at last character
set whichwrap=b,s,h,l,~,[,],<,>

" backspace acts normally in normal mode
nnoremap <bs> X

" Turn on search highlighting, but make <space><space> turn it off
set hls
nmap <space><space> :noh<CR>/<BS>

" Shortcut key to replace occurrences of a word
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" more search stuff
set ignorecase
set smartcase
set incsearch

" background color
" set term=builtin_xterm
set t_Co=256
colorscheme summerfruit256

" for powerline fonts (turns out none of these are necessary if you set the
" terminal's font to a powerline font and tell it to antialias text)
" set guifont=Inconsolata\ for\ Powerline
" set encoding=utf-8
" set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
" set termencoding=utf-8

" Vim-airline configuration
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1

" Bindings for tabbed editing
noremap <C-l> :bnext<CR>
noremap <C-h> :bprev<CR>
noremap <C-x> :bd<CR>
set hidden  " allows leaving a buffer even if it's modified
imap <C-l> <ESC>:bnext<CR>
imap <C-h> <ESC>:bprev<CR>

" ignore certain file types when autocompleting?
set wildignore+=*/.hg/*,*/.svn/*,*/.git/*,*.pyc,*.so

set showcmd                 " Show incomplete normal mode commands as I type.
set timeoutlen=300  ttimeoutlen=0

""" for coding
" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4
" indent when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" not sure what smarttab is but something related to helping me pretend my sets of 4 tabs are spaces, e.g., when deleting them.
set smarttab

" show a visual line under the cursor's current line 
set cursorline
" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" enable shortcut key for running a python script
map <C-t> :w<CR>:!python %<CR>
imap <C-t> <Esc>:w<CR>:!python %<CR>

" remove line break and indentation
nnoremap (( wd0X
