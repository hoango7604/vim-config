syntax on

" --- Plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'

Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'mkitt/tabline.vim'
Plug 'pangloss/vim-javascript'

Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'TaDaa/vimade'
Plug 'alvan/vim-closetag'
Plug 'heavenshell/vim-jsdoc', { 
			\ 'for': ['javascript', 'javascript.jsx','typescript'], 
			\ 'do': 'make install'
			\}
Plug 'andymass/vim-matchup'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'Asheq/close-buffers.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'romainl/vim-cool'

call plug#end()
