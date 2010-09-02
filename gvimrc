set gfn=DejaVu\ Sans\ Mono:h11
colorscheme chronon

" position
winpos 0 878

" size
set co=166
set lines=64

" smaller or bigger?
map <Leader>-- :set co=110<CR>
map <Leader>--- :set co=166<CR>

" no toolbar and menus.
set guioptions-=T
set guioptions-=m

" no scrollbar
set guioptions-=rL

" show tabbar
set showtabline=2

"set cursorline
" set mousefocus

" cycle though tabs with Ctrl-Tab
nmap <C-Tab> :tabnext<CR>
map <C-Tab> :tabnext<CR>
imap <C-Tab> <C-O>:tabnext<CR>

if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
    "set transp=1
endif
