" true color terminal support for tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" airline themes and extensions
let g:airline_theme = 'palenight'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_symbols_ascii = 1
" let g:airline#extensions#branch#vcs_checks = []
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:palenight_terminal_italics = 1

" Show icons in vim-airline status bar
function! AirlineWebDevIcons(...)
	let w:airline_section_x = get(w:, 'airline_section_x', g:airline_section_x)
	let w:airline_section_x .= ' %{WebDevIconsGetFileTypeSymbol()} '
	if g:webdevicons_enable_airline_statusline_fileformat_symbols
		let w:airline_section_y = ' %{&fenc . " " . WebDevIconsGetFileFormatSymbol()} '
	endif
endfunction
call airline#add_statusline_func('AirlineWebDevIcons')

" All settings must go before this command
colorscheme palenight

" Disable matchit and matchparen before using matchup
let g:loaded_matchit = 1

" --- Customize highlight color
highlight CocHighlightText				guibg=#4f4f4f															cterm=bold
highlight MatchParen              guibg=#4f4f4f															cterm=bold
highlight MatchWord               guibg=#4f4f4f															cterm=bold
highlight Visual                  guifg=white		ctermfg=white guibg=#1b8a4a cterm=bold gui=bold
highlight Search                  guifg=white		ctermfg=white guibg=#1b8a4a cterm=bold gui=bold
highlight EasyMotionMoveHL        guifg=white		ctermfg=white guibg=#1b8a4a cterm=bold gui=bold
highlight EasyMotionTarget2Second guifg=#1b8a4a
highlight link EasyMotionTarget   EasyMotionTarget2First
highlight link EasyMotionShade    Comment
highlight link CocSelectedLine    Visual
highlight clear SignColumn

" --- Other config
if executable('rg')
	let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:closetag_filetypes = 'html,javascript,javascriptreact,typescript,typescriptreact'
let g:closetag_close_shortcut = '@>'

" --- NERDTree config
" Show line number in NERDTree
let g:NERDTreeShowLineNumbers = 1

" Show hidden files and folders on NERDTree
let g:NERDTreeShowHidden = 1

" Not show bracket around icons after sourced file
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = "FE405F"
let s:git_orange = "F54D27"

" Customize icon colors
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor["ts"] = s:blue
let g:NERDTreeExtensionHighlightColor["tsx"] = s:blue

" --- Completion
" Use tab for trigger completion, completion confirm, snippet expand and jump
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your conig.
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ coc#jumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Confirm the completion when popupmenu is visible, insert <CR> and
" notify coc.nvim otherwise.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-k> to trigger completion.
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#cancel() : coc#refresh()

" declare function for moving left when closing a tab.
function! TabCloseLeft(cmd)
	if ((winnr('$') == 1 && a:cmd == "q!") || a:cmd != "q!") && tabpagenr('$') > 1 && tabpagenr() > 1 && tabpagenr() < tabpagenr('$')
		exec a:cmd | tabprevious
	else
		exec a:cmd
	endif
endfunction

" define :Q command
command Q call TabCloseLeft('q!')

" override default quit command
" cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Q' : 'q')<CR>

" Shortkey for plugins operations on buffer
nnoremap <silent> <leader>un :UndotreeShow<CR>
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <leader>bs :NERDTreeFocus<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>
nnoremap <silent> gb :Git blame<CR>
nnoremap <leader>o :Files<CR>
nnoremap <leader>O :GFiles<CR>
nnoremap <silent> <leader>. :vertical resize +5<CR>
nnoremap <silent> <leader>, :vertical resize -5<CR>
nnoremap <silent> <leader>= :resize +5<CR>
nnoremap <silent> <leader>- :resize -5<CR>
nnoremap <leader>ss :so ~/.vimrc<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :Q<CR>
nnoremap gq :Q<CR>
nnoremap <leader>xo :only<CR>
nnoremap <leader>xx :call TabCloseLeft('tabclose!')<CR>
nnoremap <leader>xb :Bdelete menu<CR>
nnoremap <leader>nt :tabnew<CR>
nnoremap <C-a> :CocList commands<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>br :checktime<CR>
nnoremap <leader>so :set so=10<CR>

" vim-plug
nnoremap <leader>I :PlugInstall<CR>
nnoremap <leader>C :PlugClean<CR>
nnoremap <leader>U :PlugUpdate<CR>

" Moving tab
nnoremap <silent> <leader>th :tabmove -1<CR>
nnoremap <silent> <leader>tl :tabmove +1<CR>

" coc.nvim remappings
nmap <silent> gc :CocFzfList<CR>
nmap <silent> gd <plug>(coc-definition)zz
nmap <silent> gx :sp<CR><plug>(coc-definition)zz
nmap <silent> gv :vsp<CR><plug>(coc-definition)zz
nmap <silent> gnt :vsp<CR><plug>(coc-definition)<C-W>Tzz
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gim <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)
nmap <silent> ge <plug>(coc-rename)
nmap gl :tabedit<bar>Git log --patch -- <bar>only<Left><Left><Left><Left><Left>
nmap gL :tabedit<bar>Git log --patch -- <C-R>%<bar>only<CR>
nmap <silent> [w <plug>(coc-diagnostic-prev)zz
nmap <silent> ]w <plug>(coc-diagnostic-next)zz
nmap <silent> [e <plug>(coc-diagnostic-prev-error)zz
nmap <silent> ]e <plug>(coc-diagnostic-next-error)zz
nmap <silent> gs :CocRestart<CR>
nmap <leader>a <plug>(coc-codeaction)

nmap <leader>c <Plug>CommentaryLine
vmap <leader>c <Plug>Commentary

" fzf-vim
function! s:build_quickfix_list(lines)
	call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
	copen
	cc
endfunction

function! s:split_drop(command, fname)
	echo a:command a:fname
	let drop_list = []
	for f in a:fname
		let bufnum = bufnr(expand(f))
		let winnums = win_findbuf(bufnum)
		if len(winnums) < 1
			call add(drop_list, f)
		else
			let split_fname = f
		endif
	endfor

	if len(drop_list) > 0
		for f in drop_list
			exe a:command . " " . f
		endfor
	else
		exe "drop " . split_fname
	endif
endfunction

let g:fzf_action = {
			\ 'enter': 'drop',
			\ 'ctrl-q': function('s:build_quickfix_list'),
			\ 'ctrl-t': 'tab drop',
			\ 'ctrl-x': function('s:split_drop', ['split']),
			\ 'ctrl-v': function('s:split_drop', ['vsplit'])
			\ }
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors = {
			\ 'fg':					['fg', 'Normal'],
			\ 'bg':					['bg', 'CursorLine'],
			\ 'hl':					['fg', 'PreProc'],
			\ 'fg+':				['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':				['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':				['fg', 'PreProc'],
			\ 'info':				['fg', 'PreProc'],
			\ 'border':   	['fg', 'Ignore'],
			\ 'prompt':   	['fg', 'Conditional', 'Comment'],
			\ 'pointer':  	['fg', 'Exception'],
			\ 'gutter':   	['fg', 'CursorLine'],
			\ 'marker':   	['fg', 'Keyword'],
			\ 'spinner':  	['fg', 'Label'],
			\ 'header':   	['fg', 'PreProc'] }
let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.85 } }
" --- [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:coc_fzf_preview = 'up:80%'

" coc.nvim extensions list
let g:coc_global_extensions = [
			\ 'coc-clangd',
			\ 'coc-css',
			\ 'coc-eslint',
			\ 'coc-git',
			\ 'coc-go',
			\ 'coc-graphql',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-prettier',
			\ 'coc-sh',
			\ 'coc-snippets',
			\ 'coc-tsserver',
			\ 'coc-docker',
			\ 'coc-yaml',
			\ 'coc-vimlsp',
			\ ]

" quickfix mappings
nmap <silent> co :copen<CR>
nmap <silent> cl :cclose<CR>
nmap <silent> cn :cnext<CR>
nmap <silent> cp :cprev<CR>

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
nmap gf :ExecuteAutoLint<CR>

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

nnoremap <expr> <c-n> ScrollPopUp(1) ? '<esc>' : '<c-n>'
nnoremap <expr> <c-p> ScrollPopUp(0) ? '<esc>' : '<c-p>'

" --- Git mergetool
nmap mt :tabedit<Bar>:Git mergetool<CR>
nmap mc <Plug>(coc-git-keepcurrent)
nmap mi <Plug>(coc-git-keepincoming)
nmap mb <Plug>(coc-git-keepboth)
nmap ]m <Plug>(coc-git-nextconflict)
nmap [m <Plug>(coc-git-prevconflict)

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
" nnoremap <silent> <leader>dj :JsDoc<CR>

" --- Config vim-grepper to replace text in multiple files
let g:grepper={}
let g:grepper.tools=["rg"]

nmap <leader>gr :Grepper<CR>
nmap go <plug>(GrepperOperator)
xmap go <plug>(GrepperOperator)

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
map s <plug>(easymotion-s2)
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
	let g:Hexokinase_highlighters = ['sign_column']
endif

" indent line
let g:indentLine_char = '¦'
" Disable url folding in markdown file
let g:indentLine_setConceal = 0

" Output the current syntax group
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" Enhancement for FocusGained & FocusLost events in vimade
if has('gui_running') == 0 && has('nvim') == 0
	call feedkeys(":silent execute '!' | redraw!\<CR>")
endif

" Remapping splitjoin.vim
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap <leader>sj :SplitjoinSplit<CR>
nmap <leader>js :SplitjoinJoin<CR>

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
nmap <silent> <leader>D :call vimspector#Launch()<CR>
nmap <silent> <C-c> :call vimspector#Reset()<CR>
nmap <silent> <C-s> :call vimspector#Restart()<CR>

" Change vimspector signs priority
let g:vimspector_sign_priority = {
			\    'vimspectorBP':         100,
			\    'vimspectorBPCond':     100,
			\    'vimspectorBPDisabled': 100,
			\    'vimspectorPC':         9999,
			\    'vimspectorPCBP':       9999,
			\ }

" vimspector package for debugging
let g:vimspector_install_gadgets = [
			\ 'vscode-node-debug2',
			\ 'debugger-for-chrome'
			\ ]

" vim-flog remapping
nmap <silent> <leader>G :Flog<CR>
nmap <silent> <leader>S :tabnew<Bar>:Git<Bar>:only<CR>
nmap <silent> yg <Plug>(FlogYank)

" Prettify git log graph by using git-forest
function FlogBuildLog() abort
	let l:state = flog#get_state()

	if l:state.no_graph
		return flog#build_log_command()
	endif

	let l:command = 'export GIT_DIR='
	let l:command .= shellescape(flog#get_fugitive_git_dir())
	let l:command .= '; '

	let l:command .= 'git-forest --style=10'
	let l:command .= substitute(flog#build_log_args(), ' --graph', '', '')
	let l:command .= ' -- '
	let l:command .= flog#build_log_paths()

	return l:command
endfunction
let g:flog_build_log_command_fn = 'FlogBuildLog'

" Compile cpp file using g++
nmap g++ :!g++ -std=c++14 -O2 -Wall main.cpp -o main && ./main<CR>
nmap c++ :!./main<CR>

" Change default minimum size of a file to be considered as a 'LargeFile'
let g:LargeFile = 1

" Disable saving the session on BufEnter
let g:obsession_no_bufenter = 1

" NERDTree configs
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapPreviewVSplit = '<C-v>'
let g:NERDTreeMapPreview = '<C-o>'
" Reduce lagging issue
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1

" --- Auto command
" styled-components
" Fix breaking syntax highlighting in very long files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Show NERDTree on vim enter
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Lessen the redraw effect when content changed among buffers with vimade
" Ref: https://github.com/TaDaa/vimade#faqhelp
autocmd! CompleteChanged * redraw

" Auto set filetype to javascriptreact if js file is open
" (For better compitable with js plugins)
" autocmd BufRead,BufNewFile *.js set filetype=javascriptreact
" autocmd BufRead,BufNewFile *.ts set filetype=typescriptreact

" Show filename whenever enter new buffer
autocmd! BufEnter * echo @%

" Transparent background
autocmd SourcePost * hi Normal ctermbg=NONE guibg=NONE

" Not open the split when jump to next ref
autocmd FileType floggraph nmap <buffer> <silent> ]r :<C-U>call flog#next_ref()<CR>
autocmd FileType floggraph nmap <buffer> <silent> [r :<C-U>call flog#previous_ref()<CR>

" Find commits in vim-flog
autocmd FileType floggraph nmap <buffer> <C-f> :Flogsetargs<Space>
autocmd FileType floggraph nmap <buffer> <C-j> :Flogjump<Space>

" Auto focus on commit split
autocmd FileType floggraph nmap <buffer> <silent> <CR> <Plug>(FlogVSplitCommitRight)<C-w>w

" Quickly copy commit hash to clipboard
autocmd FileType floggraph nmap <buffer> <silent> yy <Plug>(FlogYank)<Bar>:call setreg('*', @")<CR>
autocmd FileType floggraph vmap <buffer> <silent> yy <Plug>(FlogYank)<Bar>:call setreg('*', @")<CR>

" Enhancement for vim-fugitive diff mappings (open Gvdiffsplit in new tab)
autocmd FileType fugitive nmap <buffer> O :tabedit <Plug><cfile><Bar>:Gvdiffsplit<CR>

" Remap s in buffer when using :GStatus to easymotion sneak (since I don't
" use :Git command in vim-fugitive)
autocmd FileType fugitive nmap <buffer> s <plug>(easymotion-s2)

" Auto fold on git commit buffer
autocmd FileType git set foldmethod=syntax
autocmd FileType git nmap <buffer> <silent> ]c ]m
autocmd FileType git nmap <buffer> <silent> [c [m

" Temporarily disable Coc when using easymotion (only when using neovim)
if has('nvim')
	autocmd User EasyMotionPromptBegin silent! CocDisable
	autocmd User EasyMotionPromptEnd silent! CocEnable
endif
