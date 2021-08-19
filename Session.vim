let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit configs/01.plugins.vim
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 63 + 95) / 191)
exe 'vert 2resize ' . ((&columns * 63 + 95) / 191)
exe 'vert 3resize ' . ((&columns * 63 + 95) / 191)
argglobal
balt configs/03.plugins-setting.vim
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
let s:l = 17 - ((16 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 17
normal! 07|
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists("~/.config/nvim/configs/02.settings.vim") | buffer ~/.config/nvim/configs/02.settings.vim | else | edit ~/.config/nvim/configs/02.settings.vim | endif
balt ~/.config/nvim/configs/03.plugins-setting.vim
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
let s:l = 1 - ((0 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists("~/.config/nvim/configs/03.plugins-setting.vim") | buffer ~/.config/nvim/configs/03.plugins-setting.vim | else | edit ~/.config/nvim/configs/03.plugins-setting.vim | endif
balt ~/.config/nvim/configs/01.plugins.vim
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
let s:l = 442 - ((23 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 442
normal! 016|
lcd ~/.config/nvim
wincmd w
exe 'vert 1resize ' . ((&columns * 63 + 95) / 191)
exe 'vert 2resize ' . ((&columns * 63 + 95) / 191)
exe 'vert 3resize ' . ((&columns * 63 + 95) / 191)
tabnext 1
badd +1 ~/.config/nvim/configs/01.plugins.vim
badd +1 ~/.config/nvim/configs/03.plugins-setting.vim
badd +1 ~/.config/nvim/configs/02.settings.vim
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOSc
set winminheight=0 winminwidth=0
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
