" Pathogen setup
execute pathogen#infect()

filetype plugin indent on

" vi? This is VIMMMMMMMMMMMMMM
set nocompatible

" set a column boundary
set colorcolumn=95

" all movement keys will move the the next line when at last character
set whichwrap=b,s,h,l,~,[,],<,>

" emacs bindings
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-k> <C-r>=<SID>kill_line()<CR>

function! s:home()
    let start_col = col('.')
    normal! ^
    if col('.') == start_col
        normal! 0
    endif
    return ''
endfunction

function! s:kill_line()
    let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
    if len(text_after_cursor) == 0
        normal! J
    else
        call setline(line('.'), text_before_cursor)
    endif
    return ''
endfunction

function! s:split_line_text_at_cursor()
    let line_text = getline(line('.'))
    let text_after_cursor  = line_text[col('.')-1 :]
    let text_before_cursor = (col('.') > 1) ? line_text[: col('.')-2] : ''
    return [text_before_cursor, text_after_cursor]
endfunction

" backspace acts normally in normal mode and wraps across line breaks in
" insert mode
nnoremap <bs> X
set backspace=indent,eol,start

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

" Vim-airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
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
" turn on python code completion. To bring up the code completion window,
" type <C-x><C-o> in insert mode. To bring up context completion
" (language-agnostic), type <C-n>.
set omnifunc=pythoncomplete#Complete
" the line below makes it auto-insert only the longest common substring of
" all the options rather than the complete first one.
set completeopt+=longest
" make it so that in insert mode enter accepts the highlighted suggestion and
" then stays in insert mode
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"


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

" code folding
" to open/close a fold use za or zA to make it recursive
" to open all folds (or just one level) use zR (or zr)
" to close folds use zm or zM
set foldmethod=indent
set foldnestmax=3

" rainbow parentheses! make autocommands so they're always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""""
" find-replace configutation
" put the results window on the bottom
let g:ctrlsf_position = 'bottom'

" shortcut keys for the find-replace in files plugin ctrlsf (Ctrl+Shift+F)
" Input :CtrlSF in command line for you, just a handy shortcut.
nmap     <leader>ff <Plug>CtrlSFPrompt

" Input :CtrlSF foo in command line where foo is the current visual selected
" word, waiting for further input.
vmap     <leader>ff <Plug>CtrlSFVwordPath

" Like <Plug>CtrlSFVwordPath, but execute it immediately.
vmap     <leader>fF <Plug>CtrlSFVwordExec

" Input :CtrlSF foo in command line where foo is word under the cursor.
nmap     <leader>fn <Plug>CtrlSFCwordPath

" same, but with last search pattern
nmap     <leader>fp <Plug>CtrlSFPwordPath

" reopen the ctrl-sf window
nnoremap <leader>fo :CtrlSFOpen<CR>

" toggle the ctrl-sf window
nnoremap <leader>ft :CtrlSFToggle<CR>
inoremap <leader>ft <Esc>:CtrlSFToggle<CR>
"""""""""""""
