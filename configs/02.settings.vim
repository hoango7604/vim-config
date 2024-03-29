" Forget compatibility with Vi. Who cares.
set nocompatible

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

" --- Settings
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set hidden
set autoread

set noshowmatch
set hlsearch
set noerrorbells
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent
set ignorecase
set smartcase
set nu
set nowrap
set noswapfile
set undodir=~/.vim/undodir
set incsearch
set termguicolors
set guioptions-=L
set completeopt=longest
set pumheight=20

" Always show tabline
set showtabline=2

" Display indentation
set list lcs=tab:\¦\ 

" Using dark theme
set background=dark

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Make backspace work like in most other program
set backspace=indent,eol,start

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Set pane position when splitted
set splitbelow
set splitright

" Set allowed minimum width and height
set winminwidth=0
set winminheight=0

" Using fzf in Vim
set rtp+=/usr/local/opt/fzf

" Show signcolumn for alerting error lines
set signcolumn=yes

" Disable blinking cursor (in macvim)
set guicursor+=a:blinkon0

" Using block cursor in insert mode (in neovim)
set guicursor+=a:block

" Use UTF-8 as the default encoding
set encoding=UTF-8

" Set scroll offset
set scrolloff=10

" Open git diff in vertical splits
set diffopt+=vertical

" Use mouse to interact with vim
set mouse=a

" Make sure spacebar doesn't have any mapping before hand
nnoremap <Space> <Nop>
let mapleader = " "

" --- Key mapping
" Remapping some keys for convenience
nnoremap . ;
map ; :
inoremap jk <esc>
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap { {zz
noremap } }zz
noremap <silent> <C-d> <C-d>zz
noremap <silent> <C-u> <C-u>zz
noremap <silent> <C-e> 5<C-e>
noremap <silent> <C-y> 5<C-y>
noremap <silent> zl 20zl
noremap <silent> zh 20zh

" Replace text
nnoremap <leader>r :%s///gc<left><left><left>

" Keep in visual mode after change indent
vnoremap < <gv
vnoremap > >gv

" Keep macro at "q" character and activate it
nnoremap <leader>[ qq
nnoremap <leader><CR> @q

" Shortkey navigating & copy paste
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>H <C-w>H
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L
nnoremap <leader>y "*y
nnoremap <leader>p "*p
" nnoremap <leader>p "*p<Bar>:'[,']normal ==<CR>
nnoremap <leader>Y "+y
nnoremap <leader>P "+p
" nnoremap <leader>P "+p<Bar>:'[,']normal ==<CR>
" nnoremap p p<Bar>:'[,']normal ==<CR>
vnoremap <leader>y "*y
vnoremap <leader>p "*p
" vnoremap <leader>p "*p<Bar>:'[,']normal ==<CR>
vnoremap <leader>Y "+y
vnoremap <leader>P "+p
" vnoremap <leader>P "+p<Bar>:'[,']normal ==<CR>
" vnoremap p p<Bar>:'[,']normal ==<CR>
nmap <leader>te :tab split<CR>
nmap <leader>T :tabs<CR>

" Search result should be scrolled to middle of the screen
nnoremap n nzz
nnoremap N Nzz

" Changes in diff mode should be scrolled to middle of the screen
nnoremap ]c ]czz
nnoremap [c [czz

" Move selecting lines up & down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Only show filename when pressing <C-g>
nnoremap <C-g> :echo @%<CR>

" Mapping for 'paste' option
nnoremap <silent> <leader>sp :if &paste <Bar> set nopaste <Bar> else <Bar> set paste <Bar> endif <CR>

" Copy all content of the file to clipboard
nmap ya :%y+<CR>
