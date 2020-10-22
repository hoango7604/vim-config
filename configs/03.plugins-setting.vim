" --- color theme

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection = '0'
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_sign_column = 'bg0'
let g:airline_theme = 'gruvbox'

" All settings must go before this command
colorscheme gruvbox

" Disable matchit and matchparen before using matchup
let g:loaded_matchit = 1

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

" --- Customize highlight color
highlight CocHighlightText guibg=#4f4f4f cterm=bold
highlight MatchParen guibg=#4f4f4f cterm=bold
highlight MatchWord guibg=#4f4f4f cterm=bold
highlight Visual guifg=white ctermfg=white guibg=#1b8a4a cterm=bold gui=bold
highlight Search guifg=white ctermfg=white guibg=#1b8a4a cterm=bold gui=bold
highlight EasyMotionMoveHL guifg=white ctermfg=white guibg=#1b8a4a cterm=bold gui=bold
highlight EasyMotionTarget2Second guifg=#1b8a4a
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

let g:closetag_filetypes = 'html,javascript,jsx'
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
nnoremap <silent> <leader>f :NERDTreeFind<CR>
nnoremap <C-f> :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>gg :Gblame<CR>
nnoremap <leader>o :Files<CR>
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
nnoremap <leader>so :set so=0<CR>

" vim-plug
nnoremap <leader>in :PlugInstall<CR>
nnoremap <leader>cl :PlugClean<CR>
nnoremap <leader>up :PlugUpdate<CR>

" Moving tab
nnoremap <silent> <leader>th :tabmove -1<CR>
nnoremap <silent> <leader>tl :tabmove +1<CR>

" GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)zz
nmap <silent> <leader>gx :sp<CR><Plug>(coc-definition)zz
nmap <silent> <leader>gv :vsp<CR><Plug>(coc-definition)zz
nmap <silent> <leader>gt :vsp<CR><Plug>(coc-definition)<C-W>Tzz
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gm <Plug>(coc-implementation)
nmap <silent> <leader>ge <Plug>(coc-references)
nmap <silent> <leader>gr <Plug>(coc-rename)
nmap <silent> <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gl :<C-u>CocList diagnostics<CR>
nmap <silent> <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nmap <leader>cr :CocRestart<Cr>
nmap <leader>a <Plug>(coc-codeaction)

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
nnoremap <leader>gs :G<CR>

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

" --- Fzf history
command! -nargs=* AgQ call fzf#vim#ag(<q-args>, {'down': '40%', 'options': '-q '.shellescape(<q-args>.' ')})

" --- vim-windowswap plugin key bindings
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>sy :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>sp :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>sw :call WindowSwap#EasyWindowSwap()<CR>

" --- Switch to previous active tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nnoremap <silent> <leader>tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" --- JsDoc add description
nnoremap <silent> <leader>d :JsDoc<CR>

" --- Config vim-grepper to replace text in multiple files
let g:grepper={}
let g:grepper.tools=["rg"]

xnoremap gr <Plug>(GrepperOperation)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <leader>R
      \ :let @s='\<'.expand('<cword>').'\>'<CR>
      \ :Grepper -cword -noprompt<CR>
      \ :cfdo %s/<C-r>s//g \| update
      \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xnoremap <leader>R
      \ "sy
      \ gvgr
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
map f <Plug>(easymotion-s)
map F <Plug>(easymotion-s)
map s <Plug>(easymotion-s2)
nmap * <Plug>(easymotion-sn)<C-r><C-w>
nmap / <Plug>(easymotion-sn)
nmap <silent><expr> <leader>/ incsearch#go(<SID>config_easyfuzzymotion())
nmap <leader><leader>r <Plug>(easymotion-repeat)
nmap . <Plug>(easymotion-next)zz
nmap , <Plug>(easymotion-prev)zz

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
let g:Hexokinase_highlighters = ['foregroundfull']

" indent line
let g:indentLine_char = '¦'

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
      \ 'colbufsize': 15,
      \ 'rowbufsize': 15,
      \ 'checkinterval': 100,
      \ 'usecursorhold': 0,
      \ 'detecttermcolors': 0,
      \ 'enablescroll': 1,
      \ 'enablesigns': 1,
      \ 'signsid': 13100,
      \ 'signsretentionperiod': 4000,
      \ 'fademinimap': 1,
      \ 'fadepriority': 10,
      \ 'groupdiff': 1,
      \ 'groupscrollbind': 0,
      \ 'enablefocusfading': 0,
      \ 'enablebasegroups': 1,
      \ 'basegroups': ['Folded', 'Search', 'SignColumn', 'LineNr', 'CursorLine', 'CursorLineNr', 'DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText', 'FoldColumn', 'Whitespace'],
      \ }

" Add trailing comma after split
let g:splitjoin_trailing_comma = 1

" --- Auto command
" styled-components
" Fix breaking syntax highlighting in very long files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Show NERDTree on vim enter
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Auto reload opened buffers after git checkout
autocmd FocusGained * :checktime<CR>

" Lessen the redraw effect when content changed among buffers with vimade
" Ref: https://github.com/TaDaa/vimade#faqhelp
autocmd! CompleteChanged * redraw
