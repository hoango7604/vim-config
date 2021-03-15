" --- Plugins
call plug#begin('~/.vim/plugged')

" --- Plugins for editors (IDE)
" Intellisense engine, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" NERDTree (directory tree)
Plug 'preservim/nerdtree'
" Support git action
Plug 'tpope/vim-fugitive'
" Extension for vim-fugitive to show commit message directly
Plug 'tommcdo/vim-fugitive-blame-ext'
" Undotree
Plug 'mbbill/undotree'
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
" Provide mapping to easily delete, chnge and add surrounding in pairs
Plug 'tpope/vim-surround'
" Quickly add surrounding in pairs
Plug 'jiangmiao/auto-pairs'
" Fade inactive buffers text to help focus on currently working buffer
Plug 'TaDaa/vimade'
" Enhance vim FocusGained and FocusLost events for autocommand
Plug 'tmux-plugins/vim-tmux-focus-events'
" Auto close XHTML tag
Plug 'alvan/vim-closetag'
" Smart compose for code completion
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
" Helper for closing buffers
Plug 'Asheq/close-buffers.vim'
" Helper for swapping buffers
Plug 'wesQ3/vim-windowswap'
" Jump to places in text editor quickly
Plug 'easymotion/vim-easymotion'
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
" Vim plugin to use Tig as git client
Plug 'iberianpig/tig-explorer.vim'

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
" Highlight indent levels
Plug 'Yggdroot/indentLine'

" --- Other plugins
" Language server protocol for vim language
Plug 'prabirshrestha/vim-lsp'
" Support session in vim
Plug 'tpope/vim-obsession'
" Inspector in vim
Plug 'puremourning/vimspector'

" --- Plugins for language support
" Collection of language pack
Plug 'sheerun/vim-polyglot'
" Support javascript syntax highlighting and autosuggestion
" Plug 'pangloss/vim-javascript'
" Support writing doc for js file
Plug 'heavenshell/vim-jsdoc', {
      \ 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
      \ 'do': 'make install'
      \}
" Jsx prettier
Plug 'maxmellon/vim-jsx-pretty'
" JSON syntax
Plug 'kevinoid/vim-jsonc'

call plug#end()
