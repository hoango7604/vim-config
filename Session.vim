let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 configs/01.plugins.vim
badd +1 init.vim
badd +22 after/plugin/lspconfig.rc.vim
badd +131 configs/02.settings.vim
badd +129 configs/03.plugins-setting.vim
badd +24 after/plugin/completion.rc.vim
badd +1 configs-clone/01.plugins.vim
badd +0 ~/.config/nvim/.git/index
badd +0 fugitive:///Users/hoango7604/.config/nvim/.git//0/after/plugin/lspconfig.rc.vim
argglobal
%argdel
tabnew
tabnew
tabrewind
edit configs/01.plugins.vim
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt init.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 9 - ((8 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 0
wincmd w
argglobal
if bufexists("after/plugin/lspconfig.rc.vim") | buffer after/plugin/lspconfig.rc.vim | else | edit after/plugin/lspconfig.rc.vim | endif
if &buftype ==# 'terminal'
  silent file after/plugin/lspconfig.rc.vim
endif
balt after/plugin/completion.rc.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 22 - ((21 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 22
normal! 030|
wincmd w
argglobal
if bufexists("after/plugin/completion.rc.vim") | buffer after/plugin/completion.rc.vim | else | edit after/plugin/completion.rc.vim | endif
if &buftype ==# 'terminal'
  silent file after/plugin/completion.rc.vim
endif
balt after/plugin/lspconfig.rc.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 38 - ((37 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 38
normal! 015|
wincmd w
wincmd =
tabnext
edit ~/.config/nvim/.git/index
argglobal
balt after/plugin/lspconfig.rc.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr=<<<<<<<<,>>>>>>>>
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 8 - ((7 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 0
tabnext
edit fugitive:///Users/hoango7604/.config/nvim/.git//0/after/plugin/lspconfig.rc.vim
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt after/plugin/lspconfig.rc.vim
setlocal fdm=diff
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists("after/plugin/lspconfig.rc.vim") | buffer after/plugin/lspconfig.rc.vim | else | edit after/plugin/lspconfig.rc.vim | endif
if &buftype ==# 'terminal'
  silent file after/plugin/lspconfig.rc.vim
endif
balt fugitive:///Users/hoango7604/.config/nvim/.git//0/after/plugin/lspconfig.rc.vim
setlocal fdm=diff
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 5 - ((4 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 0
wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOSc
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
