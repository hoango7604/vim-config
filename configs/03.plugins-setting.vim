" --- color theme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection = '0'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_sign_column = 'bg0'

" vim-airline
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1

" All settings must go before this command
colorscheme gruvbox

" Disable matchit and matchparen before using matchup
let g:loaded_matchit = 1

" --- Customize highlight color
highlight CocHighlightText guibg=#4f4f4f cterm=bold
highlight MatchParen guibg=#4f4f4f cterm=bold
highlight MatchWord guibg=#4f4f4f cterm=bold
highlight Visual guifg=white ctermfg=white guibg=#1b8a4a cterm=bold gui=bold
highlight Search guifg=white ctermfg=white guibg=#1b8a4a cterm=bold gui=bold
highlight EasyMotionMoveHL guifg=white ctermfg=white guibg=#1b8a4a cterm=bold gui=bold
highlight EasyMotionTarget2Second guifg=#1b8a4a
highlight link EasyMotionTarget EasyMotionTarget2First
highlight link EasyMotionShade Comment

" --- Other config
if executable('rg')
  let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:closetag_filetypes = 'html,javascript,jsx,typescript,tsx'
let g:closetag_close_shortcut = '@>'

" --- NERDTree config
" Show line number in NERDTree
let g:NERDTreeShowLineNumbers = 1

" Show hidden files and folders on NERDTree
let g:NERDTreeShowHidden = 1

" --- Completion
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your conig.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-k> to trigger completion.
inoremap <silent><expr> <c-k> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Shortkey for plugins operations on buffer
nnoremap <silent> <leader>un :UndotreeShow<CR>
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <leader>bs :NERDTreeFocus<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>
nnoremap <leader>gg :Gblame<CR>
nnoremap <leader>o :Files<CR>
nnoremap <leader>O :GFiles<CR>
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>. :resize +5<CR>
nnoremap <silent> <leader>, :resize -5<CR>
nnoremap <leader>ss :so ~/.config/nvim/init.vim<Bar>VimadeRedraw<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>xo <C-w>o
nnoremap <leader>xx :tabclose<CR>
nnoremap <leader>xb :Bdelete menu<CR>
nnoremap <leader>nt :tabnew<CR>
nnoremap <C-a> :CocList commands<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>br :checktime<CR>
nnoremap <leader>so :set so=10<CR>

" vim-plug
nnoremap <leader>in :PlugInstall<CR>
nnoremap <leader>cl :PlugClean<CR>
nnoremap <leader>up :PlugUpdate<CR>

" Moving tab
nnoremap <silent> <leader>th :tabmove -1<CR>
nnoremap <silent> <leader>tl :tabmove +1<CR>

" coc.nvim remappings
nmap <silent> <leader>gd <plug>(coc-definition)zz
nmap <silent> <leader>gx :sp<CR><plug>(coc-definition)zz
nmap <silent> <leader>gv :vsp<CR><plug>(coc-definition)zz
nmap <silent> <leader>gt :vsp<CR><plug>(coc-definition)<C-W>Tzz
nmap <silent> <leader>gy <plug>(coc-type-definition)
nmap <silent> <leader>gm <plug>(coc-implementation)
nmap <silent> <leader>ge <plug>(coc-references)
nmap <silent> <leader>gr <plug>(coc-rename)
nmap <silent> <leader>g[ <plug>(coc-diagnostic-prev)
nmap <silent> <leader>gl :<C-u>CocList diagnostics<CR>
nmap <silent> <leader>g] <plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <plug>(coc-diagnostic-next-error)
nmap <leader>cr :CocRestart<Cr>
nmap <leader>a <plug>(coc-codeaction)

" coc.nvim extensions list
let g:coc_global_extensions = [
      \ 'coc-vimlsp',
      \ 'coc-highlight',
      \ 'coc-eslint',
      \ 'coc-tsserver',
      \ 'coc-sh',
      \ 'coc-omnisharp',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-git'
      \ ]

" Search among files with the matching phrase
nnoremap <leader>f :Rg<Space>
" The same as above except it works with a visual selection.
xmap <leader>f
      \ "fy
      \ :Rg <C-r>f<CR>
" Open recent search popup
nnoremap <leader>F :Rg <C-r>f<CR>

" --- Autolint command
command! -nargs=0 ExecuteAutoLint
      \ :call CocActionAsync('runCommand', 'eslint.executeAutofix')
nmap <leader>gf :ExecuteAutoLint<CR>

" --- Show document
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use K to show documentation in preview window.
nmap <silent> K :call <SID>show_documentation()<CR>

" Scroll when document popup opened by Shift-K
function FindCursorPopUp()
  let radius = get(a:000, 0, 2)
  let srow = screenrow()
  let scol = screencol()
  " it's necessary to test entire rect, as some popup might be quite small
  for r in range(srow - radius, srow + radius)
    for c in range(scol - radius, scol + radius)
      let winid = popup_locate(r, c)
      if winid != 0
        return winid
      endif
    endfor
  endfor

  return 0
endfunction

function ScrollPopUp(down)
  let winid = FindCursorPopUp()
  if winid == 0
    return 0
  endif

  let pp = popup_getpos(winid)
  call popup_setoptions( winid,
        \ {'firstline' : pp.firstline + ( a:down ? 1 : -1 ) } )

  return 1
endfunction

nnoremap <expr> <c-j> ScrollPopUp(1) ? '<esc>' : '<c-j>'
nnoremap <expr> <c-k> ScrollPopUp(0) ? '<esc>' : '<c-k>'

" --- Git mergetool
nnoremap <leader>gi :diffget REMOTE<Bar>diffupdate<CR>
nnoremap <leader>gc :diffget LOCAL<Bar>diffupdate<CR>
nnoremap <leader>gb :/>>>>>>>/;?<<<<<<<?,.g/^\(<<<<<<<\\|=======\\|>>>>>>>\)/d<CR>

" --- Search for selected text, forwards or backwards.
" Press * to search forwards or # to search backwards
vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gVzv:call setreg('"', old_reg, old_regtype)<CR>

" --- vim-windowswap plugin key bindings
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>sw :call WindowSwap#EasyWindowSwap()<CR>

" --- Switch to previous active tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nnoremap <silent> <leader>tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" --- JsDoc add description
nnoremap <silent> <leader>dj :JsDoc<CR>

" --- Config vim-grepper to replace text in multiple files
let g:grepper={}
let g:grepper.tools=["rg"]

nmap <leader>go <plug>(GrepperOperator)
xmap <leader>go <plug>(GrepperOperator)

" Find and replace all text under the cursor. It's similar to <leader>r
" except this one applies to all matches
" across all files instead of just the current file.
nmap <leader>R
      \ :let @s='\<'.expand('<cword>').'\>'<CR>
      \ :Grepper -cword -noprompt<CR>
      \ :cfdo %s/<C-r>s//g \| update
      \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <leader>R
      \ "sy
      \ v_gv<leader>go
      \ :cfdo %s/<C-r>s//g \| update
      \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" --- [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" --- vim-matchup
" Not display matching tag/parentheses when off screen
let g:matchup_matchparen_offscreen = {}

let g:matchup_matchpref = {
      \ 'html': { 'tagnameonly': 1, },
      \ 'javascript.jsx': { 'tagnameonly': 1, },
      \ 'javascript': { 'tagnameonly': 1, },
      \ 'jsx': { 'tagnameonly': 1, },
      \}

" let b:match_words = 1

" --- Folding
command! -nargs=0 Fold
      \ :call CocActionAsync('fold')
nnoremap <leader>bf :Fold<CR>

" --- vim-easymotion
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
" Use `l` and match `l` and `L`
let g:EasyMotion_smartcase = 1
" Scroll off search result to be centered
let g:EasyMotion_off_screen_search = 999

" incsearch.vim x vim-easymotion
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
        \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
        \   'keymap': {
        \     "\<CR>": '<Over>(easymotion)'
        \   },
        \   'is_expr': 0
        \ }), get(a:, 1, {}))
endfunction

" incsearch.vim x fuzzy x vim-easymotion
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
        \   'converters': [incsearch#config#fuzzy#converter()],
        \   'modules': [incsearch#config#easymotion#module()],
        \   'keymap': {"\<CR>": '<Over>(easymotion)'},
        \   'is_expr': 0,
        \ }), get(a:, 1, {}))
endfunction

" Use easymotion to replace default search of Vim
map f <plug>(easymotion-bd-f)
map F <plug>(easymotion-bd-f)
map t <plug>(easymotion-bd-t)
map T <plug>(easymotion-bd-t)
nmap s <plug>(easymotion-s2)
nmap * <plug>(easymotion-sn)<C-r><C-w>
xmap *
      \ "sy
      \ <plug>(easymotion-sn)<C-r>s
nmap / <plug>(easymotion-sn)
nmap <silent><expr> <leader>/ incsearch#go(<SID>config_easyfuzzymotion())
nmap <leader><leader>r <plug>(easymotion-repeat)
nmap . <plug>(easymotion-next)zz
nmap , <plug>(easymotion-prev)zz

" vim-lsp config for bash language server
" Ref: https://github.com/bash-lsp/bash-language-server
if executable('bash-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
        \ 'allowlist': ['sh'],
        \ })
endif

" hexokinase-highlighters
if has('nvim')
  let g:Hexokinase_highlighters = ['virtual']
else
  let g:Hexokinase_highlighters = ['signcolumn']
endif

" indent line
let g:indentLine_char = '¦'
" Disable url folding in markdown file
let g:indentLine_setConceal = 0

" Output the current syntax group
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" Adjust fade level for inactive buffers
let g:vimade = {
      \ 'normalid': 'Vimade',
      \ 'normalncid': '',
      \ 'basefg': '',
      \ 'basebg': '',
      \ 'fadelevel': 0.4,
      \ 'checkinterval': 100,
      \ 'colbufsize': 15,
      \ 'rowbufsize': 15,
      \ 'usecursorhold': 1,
      \ 'detecttermcolors': 0,
      \ 'enablescroll': 1,
      \ 'enablesigns': 1,
      \ 'signsid': 13100,
      \ 'signsretentionperiod': 4000,
      \ 'fademinimap': 1,
      \ 'fadepriority': 10,
      \ 'groupdiff': 1,
      \ 'groupscrollbind': 0,
      \ 'enablefocusfading': 1,
      \ 'enablebasegroups': 1,
      \ 'basegroups': ['Folded', 'Search', 'SignColumn', 'LineNr', 'CursorLine', 'CursorLineNr', 'DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText', 'FoldColumn', 'Whitespace'],
      \ }

" Enhancement for FocusGained & FocusLost events in vimade
if has('gui_running') == 0 && has('nvim') == 0
  call feedkeys(":silent execute '!' | redraw!\<CR>")
endif

" Remapping splitjoin.vim
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap <leader>gs :SplitjoinSplit<CR>
nmap <leader>gj :SplitjoinJoin<CR>

" Add trailing comma after split
let g:splitjoin_trailing_comma = 1

" vim-maximizer
nmap <silent> <leader>z :MaximizerToggle!<CR>

" Enable standard mapping in vimspector
let g:vimspector_enable_mappings = 'HUMAN'

" Remapping vimspector short keys
nmap <silent> <leader>dc <plug>VimspectorContinue
nmap <silent> <leader>ds <plug>VimspectorStop
nmap <silent> <leader>dr <plug>VimspectorRestart
nmap <silent> <leader>dp <plug>VimspectorPause
nmap <silent> <leader>db <plug>VimspectorToggleBreakpoint
nmap <silent> <leader>dxb <plug>VimspectorToggleConditionalBreakpoint
nmap <silent> <leader>dfb <plug>VimspectorAddFunctionBreakpoint
nmap <silent> <leader>dr <plug>VimspectorRunToCursor
nmap <silent> <leader>dn <plug>VimspectorStepOver
nmap <silent> <leader>di <plug>VimspectorStepInto
nmap <silent> <leader>do <plug>VimspectorStepOut
nmap <silent> <leader>dv <plug>VimspectorBalloonEval
xmap <silent> <leader>dv <plug>VimspectorBalloonEval
nmap <silent> <leader>du <plug>VimspectorUpFrame
nmap <silent> <leader>dd <plug>VimspectorDownFrame
nmap <silent> <leader>dl :call vimspector#ListBreakpoints()<CR>
nmap <silent> <C-s> :call vimspector#Launch()<CR>
nmap <silent> <C-c> :call vimspector#Reset()<CR>

" Change vimspector signs priority
let g:vimspector_sign_priority = {
      \    'vimspectorBP':         100,
      \    'vimspectorBPCond':     100,
      \    'vimspectorBPDisabled': 100,
      \    'vimspectorPC':         999,
      \    'vimspectorPCBP':       999,
      \ }

" vimspector package for debugging
let g:vimspector_install_gadgets = [
      \ 'vscode-node-debug2',
      \ 'debugger-for-chrome'
      \ ]

" vim-flog remapping
nmap <silent> <leader>G :Flog<CR>
nmap <silent> <leader>S :Gstatus<CR>
nmap <silent> yg <Plug>(FlogYank)

" --- Auto command
" styled-components
" Fix breaking syntax highlighting in very long files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Show NERDTree on vim enter
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Lessen the redraw effect when content changed among buffers with vimade
" Ref: https://github.com/TaDaa/vimade#faqhelp
autocmd! CompleteChanged * redraw

" Auto set filetype to javascriptreact if js file is open
" (For better compitable with js plugins)
autocmd BufRead,BufNewFile *.js set filetype=javascriptreact
autocmd BufRead,BufNewFile *.ts set filetype=typescriptreact

" Show filename whenever enter new buffer
autocmd! BufEnter * echo @%

" If another buffer tries to replace NERDTree, put it in another window, and
" then bring back
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Not open the split when jump to next ref
autocmd FileType floggraph nmap <buffer> <silent> ]r :<C-U>call flog#next_ref()<CR>
autocmd FileType floggraph nmap <buffer> <silent> [r :<C-U>call flog#previous_ref()<CR>

" Find commits in vim-flog
autocmd FileType floggraph nmap <C-f> :Flogsetargs<Space>
autocmd FileType floggraph nmap <C-j> :Flogjump<Space>

" Auto focus on commit split
autocmd FileType floggraph nmap <buffer> <silent> <CR> <Plug>(FlogVSplitCommitRight)<C-w>w

" Enhancement for vim-fugitive diff mappings
autocmd User FugitiveIndex nmap <buffer> O :Gtabedit <Plug><cfile><Bar>Gvdiffsplit<CR>

" Remap s in buffer when using :GStatus to easymotion sneak (since I don't
" use :Git command in vim-fugitive)
autocmd User FugitiveIndex nmap <buffer> s <plug>(easymotion-s2)

" Auto fold on git commit buffer
autocmd FileType git set foldmethod=syntax
