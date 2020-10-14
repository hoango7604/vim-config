syntax on

" --- Settings
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set hidden
set autoread

" set noshowmatch
set hlsearch
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent
set ignorecase
set smartcase
set relativenumber
set nu
set nowrap
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors

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

" Using fzf in Vim
set rtp+=/usr/local/opt/fzf

" Hide annoying left side sign column
set signcolumn=no

" Keep cursor the same as other modes in insert mode
set guicursor=

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("patch-8.1.1564")
" 	" Recently vim can merge signcolumn and number column into one
" 	set signcolumn=number
" else
" 	set signcolumn=yes
" endif

" Make sure spacebar doesn't have any mapping before hand
nnoremap <Space> <Nop>
let mapleader = " "

" --- Key mapping
" Remapping some keys for convenience
noremap . ;
noremap ; :
inoremap jk <esc>
nnoremap zx zz10<C-e>
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
noremap <silent> zl 10zl
noremap <silent> zh 10zh
nnoremap <silent> <leader>gt gt
nnoremap <silent> <leader>gT gT

" Moving cursor in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-k> <up>
inoremap <C-j> <down>

" Replace text
nnoremap <leader>r :%s///gc<left><left><left>

" Break line with commas into multiple lines
nnoremap <leader>m :s/\((\zs\\|{\ *\zs\\|,\ *\zs\\|)\\|\ *}\)/\r&/g<CR><Bar>:'[,']normal ==<CR>

" Keep in visual mode after change indent
vnoremap < <gv
vnoremap > >gv

" Keep macro at "q" character and activate it
nnoremap <leader>[ qq
nnoremap <leader><CR> @q

" Shortkey navigating & copy paste
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>y "*y
nnoremap <leader>p "*p<Bar>:'[,']normal ==<CR>
nnoremap <leader>Y "+y
nnoremap <leader>P "+p<Bar>:'[,']normal ==<CR>
nnoremap p p<Bar>:'[,']normal ==<CR>
vnoremap <leader>y "*y
vnoremap <leader>p "*p<Bar>:'[,']normal ==<CR>
vnoremap <leader>Y "+y
vnoremap <leader>P "+p<Bar>:'[,']normal ==<CR>
vnoremap p p<Bar>:'[,']normal ==<CR>

" Move selecting lines up & down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
