set nocompatible
set shell=/bin/sh
" UTF-8
set encoding=utf-8

" space for leader
map <space> <leader>
map <space><space> <leader><leader>

" Disable backup. No swap files.
set nobackup
set nowb
set noswapfile

set tabstop=2                 " A tab is 2 spaces
set shiftwidth=2 " an autoindent (with <<) is two spaces
set expandtab                 " Use spaces instead of tabs
set smarttab                  " Be smart when using tabs ;-)
set softtabstop=2             " 1 tab is 2 spaces

" Search
set ignorecase " Case insensitive search
set incsearch  " Makes search act like search in modern browsers
set hlsearch   " Highlight search results

set autoread "Reload files changed outside vim

set nowrap "Don't wrap lines
set linebreak "Wrap lines at convenient points
set nolist
set tw=0

" window navigation shortcuts, ctrl h j k l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" turn on or off paste mode
map <leader>pp :setlocal paste!<cr>
map <leader>po :setlocal nopaste!<cr>

" insert a new line at the cursor without leaving normal mode
nnoremap <s-enter> a<cr><esc>
nnoremap <c-enter> I<cr><esc>k
nnoremap <a-enter> o<esc>k

map <leader>a :Ack! -i ""<left>

set wildignore+=*/tmp/*,*.so,*.swp
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/.bundle/*,*/.sass-cache/*
set wildignore+=*/node_modules/*

syntax enable
filetype plugin indent on

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'kien/ctrlp.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/restore_view.vim'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'scrooloose/nerdcommenter'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'vim-scripts/AutoComplPop'
Plug 'tpope/vim-vinegar'
Plug 'bling/vim-airline'
Plug 'reedes/vim-colors-pencil'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }
" Set working dir to root automatically
Plug 'airblade/vim-rooter'
" Better buffer handling
Plug 'jeetsukumaran/vim-buffergator'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Fish syntax
Plug 'dag/vim-fish'
" {{{
  " Set up :make to use fish for syntax checking.
  autocmd FileType fish compiler fish

  " Set this to have long lines wrap inside comments.
  autocmd FileType fish setlocal textwidth=79

  " Enable folding of block structures in fish.
  autocmd FileType fish setlocal foldmethod=expr
" }}}

call plug#end()

colorscheme pencil
set background=dark

set linespace=1
set number

" Instant gitgutter
let g:gitgutter_realtime=1
set updatetime=750
set tabstop=2


" Searching
set ignorecase
set smartcase

set autoindent
set smartindent

" show matching brackets
set showmatch
set matchtime=7

" No ugly scrollbars
set go-=L
set go-=r

cmap Q :quit<cr>

set scrolloff=8 "Start scrolling 8 lines away from margins
" For restore_view.vim
" http://www.vim.org/scripts/script.php?script_id=4021
set viewoptions=cursor,folds,slash,unix

let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1

" Strip tailing spaces by pressing F5
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" NERDtree style netrw
let g:netrw_liststyle=3
map <leader>k :Explore<cr>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        exec t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>

"Never autoload sessions
:let g:session_autoload = 'no'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Some bindings
" ==============
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR> 

" Quit window
nmap <leader>qq :quit<CR>

" Splits
nmap <silent><leader>c :clo<CR>
nmap <silent><leader>v :vspl<CR>
nmap <silent><leader>s :spl<CR>


so ~/.vim/settings.vim
