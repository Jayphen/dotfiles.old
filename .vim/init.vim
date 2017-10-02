set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set shell=/bin/zsh
" UTF-8
set encoding=utf-8

" space for leader
let mapleader = "\<Space>"

" Disable backup. No swap files.
set nobackup
set nowb
set noswapfile

set tabstop=2                 " A tab is 2 spaces
set shiftwidth=2 " an autoindent (with <<) is two spaces
set expandtab                 " Use spaces instead of tabs
set smarttab                  " Be smart when using tabs ;-)
set softtabstop=2             " 1 tab is 2 spaces

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Search
set ignorecase " Case insensitive search
set incsearch  " Makes search act like search in modern browsers

set autoread "Reload files changed outside vim

set nowrap "Don't wrap lines
set linebreak "Wrap lines at convenient points
set nolist
set tw=0

" turn on or off paste mode
map <leader>pp :setlocal paste!<cr>
map <leader>po :setlocal nopaste!<cr>

" Jump to vimrc
nmap <silent> ;v :next $MYVIMRC<CR>

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
Plug 'junegunn/vim-easy-align'
" {{{
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
" }}}

Plug 'scrooloose/nerdtree'
" NERDtree config {{{
  " Open NERDtree to current file dir
  map <leader>r :NERDTreeFind<cr>
  map <leader>n :NERDTreeToggle<cr>
  " Make nerdtree look nice
  "let g:NERDTreeMinimalUI = 1
  "let g:NERDTreeDirArrows = 1
  "let g:NERDTreeWinSize = 30
  "let g:NERDTreeChDirMode=2
  let g:NERDTreeQuitOnOpen = 1
  let g:NERDTreeShowHidden=1
  let g:NERDTreeRespectWildIgnore = 1
  " Open NERDTree by default unless a file is specified
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree
" }}}
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/restore_view.vim'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'scrooloose/nerdcommenter'

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapCR=0
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" deoplete config {{{
let g:deoplete#enable_at_startup = 1
" }}}
Plug 'SirVer/ultisnips'
" UltiSnips config {{{
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

Plug 'bling/vim-airline'
" Better buffer handling
Plug 'jeetsukumaran/vim-buffergator'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'mattn/emmet-vim'
Plug 'jacob-ogre/vim-syncr'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
" JavaScript support
Plug 'pangloss/vim-javascript'
" JSX support
Plug 'mxw/vim-jsx'
" JSX settings {{{
  let g:jsx_ext_required = 0

" Zoom in to windows with ctrl-w-m
Plug 'dhruvasagar/vim-zoom'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Load .local.vimrc in project dir
Plug 'thinca/vim-localrc'

" themes
Plug 'mhartington/oceanic-next'

" vim-devicons
Plug 'ryanoasis/vim-devicons'
" {{{
  let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1

  let g:webdevicons_conceal_nerdtree_brackets = 1
" }}}

call plug#end()

" {{{
if (has("termguicolors"))
 set termguicolors
endif
" Theme
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
highlight Comment cterm=italic
" }}}

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

set foldmethod=marker

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

"Never autoload sessions
:let g:session_autoload = 'no'

" filetype settings
" ===================
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd FileType php setlocal expandtab
  autocmd FileType php setlocal list
  autocmd FileType php setlocal listchars=tab:+\ ,eol:-
  autocmd FileType php setlocal formatprg=par\ -w80\ -T4
  autocmd FileType php setlocal sts=4 ts=4 sw=4 expandtab
  autocmd FileType js setlocal foldmethod=syntax
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Some bindings
" ==============
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>ll :bnext<CR>

" Move to the previous buffer
nmap <leader>hh :bprevious<CR>

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
nmap <silent><leader>sp :spl<CR>

nmap <leader>ff :FZF<CR>
nmap <leader>fx :FZF -x<CR>

if has('nvim')
  :tnoremap <Esc> <C-\><C-n>
endif
so ~/.vim/settings.vim
