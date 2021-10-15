" --- Plugins
call plug#begin('~/.vim/plugged')

" --- Plugins for editors (IDE)
" Intellisense engine, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Support snippets for coc-snippets
Plug 'honza/vim-snippets'
" NERDTree (directory tree)
Plug 'preservim/nerdtree'
" Support git action
Plug 'tpope/vim-fugitive'
" Extension for vim-fugitive to show commit message directly
Plug 'tommcdo/vim-fugitive-blame-ext'
" Git branch viewer integrates with fugitive
" Plug 'rbong/vim-flog'
Plug 'TamaMcGlinn/vim-flog', { 'branch': 'feature/quick_navigate' }
" Support action on project (find text in files, open files, etc.)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Support Fzf to fully operate inside vim
Plug 'junegunn/fzf.vim'
" Helper for using grep tool and quickfix list (to refactor code across files)
Plug 'mhinz/vim-grepper'
" Extend default % in vim to match html tag and so on
Plug 'andymass/vim-matchup'
" Quickly add comment string
Plug 'tpope/vim-commentary'
" Extension for vim-commentary to find matching syntax on difference files
Plug 'suy/vim-context-commentstring'
" Provide mapping to easily delete, change and add surrounding in pairs
Plug 'tpope/vim-surround'
" Quickly add surrounding in pairs
Plug 'jiangmiao/auto-pairs'
" Auto close XHTML tag
Plug 'alvan/vim-closetag'
" Helper for closing buffers
Plug 'Asheq/close-buffers.vim'
" Helper for swapping buffers
Plug 'wesQ3/vim-windowswap'
" Jump to places in text editor quickly
Plug 'aelkazdadi/vim-easymotion', { 'branch': 'fast-hl' }
" Plug 'easymotion/vim-easymotion'
" Extend default search function in vim
Plug 'haya14busa/incsearch.vim'
" Extension for incsearch.vim to operate fuzzy search
Plug 'haya14busa/incsearch-fuzzy.vim'
" Extension for incsearch.vim to integrate with vim-easymotion
Plug 'haya14busa/incsearch-easymotion.vim'
" Disable search highlighting when done searching and re-enable when search again
Plug 'romainl/vim-cool'
" Split join line/multiple lines
Plug 'AndrewRadev/splitjoin.vim'
" Maximize working buffer
Plug 'szw/vim-maximizer'
" Working with large file
Plug 'vim-scripts/LargeFile'

" --- Plugins for theme and status line
" Grubbox theme
Plug 'gruvbox-community/gruvbox'
" Modification of gruvbox theme to make color scheme smoothier
Plug 'sainnhe/gruvbox-material'
" Status bar
Plug 'vim-airline/vim-airline'
" Tab bar
Plug 'mkitt/tabline.vim'
" Display colours prettier than default
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" --- Other plugins
" Support session in vim
Plug 'tpope/vim-obsession'
" Inspector in vim
Plug 'puremourning/vimspector'

" --- Plugins for language support
" Collection of language pack
Plug 'sheerun/vim-polyglot'

call plug#end()
