syntax on

" --- Plugins
call plug#begin('~/.vim/plugged')

" Plugins for editors (IDE)
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine, full language server protocol support as VSCode
Plug 'preservim/nerdtree' " NERDTree (directory tree)
Plug 'tpope/vim-fugitive' " Support git action
Plug 'tommcdo/vim-fugitive-blame-ext' " Extension for vim-fugitive to show commit message directly
Plug 'mbbill/undotree' " Undotree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Support action on project (find text in files, open files, etc.)
Plug 'junegunn/fzf.vim' " Support Fzf to fully operate inside vim
Plug 'mhinz/vim-grepper' " Helper for using grep tool and quickfix list (to refactor code across files)
Plug 'andymass/vim-matchup' " Extend default % in vim to match html tag and so on
Plug 'tpope/vim-commentary' " Quickly add comment string
Plug 'suy/vim-context-commentstring' " Extension for vim-commentary to find matching syntax on difference files
Plug 'tpope/vim-surround' " Provide mapping to easily delete, chnge and add surrounding in pairs
Plug 'jiangmiao/auto-pairs' " Quickly add surrounding in pairs
Plug 'TaDaa/vimade' " Fade inactive buffers text to help focus on currently working buffer
Plug 'alvan/vim-closetag' " Auto close XHTML tag
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' } " Smart compose for code completion
Plug 'Asheq/close-buffers.vim' " Helper for closing buffers
Plug 'wesQ3/vim-windowswap' " Helper for swapping buffers
Plug 'easymotion/vim-easymotion' " Jump to places in text editor quickly
Plug 'haya14busa/incsearch.vim' " Extend default search function in vim
Plug 'haya14busa/incsearch-fuzzy.vim' " Extension for incsearch.vim to operate fuzzy search
Plug 'haya14busa/incsearch-easymotion.vim' " Extension for incsearch.vim to integrate with vim-easymotion
Plug 'romainl/vim-cool' " Disable search highlighting when done searching and re-enable when search again

" Plugins for theme and status line
Plug 'gruvbox-community/gruvbox' " Grubbox theme
Plug 'vim-airline/vim-airline' " Status bar
Plug 'mkitt/tabline.vim' " Tab bar

" Plugins for language support
Plug 'sheerun/vim-polyglot' " Collection of language pack
Plug 'pangloss/vim-javascript' " Support javascript syntax highlighting and autosuggest
Plug 'heavenshell/vim-jsdoc', {
			\ 'for': ['javascript', 'javascript.jsx','typescript'], 
			\ 'do': 'make install'
			\} " Support writing doc for js file
Plug 'styled-components/vim-styled-components', { 'branch': 'main' } " Support syntax highlighting for styled-components lib
Plug 'hail2u/vim-css3-syntax' " CSS3 highlight syntax

call plug#end()
