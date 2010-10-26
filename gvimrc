set gfn=DejaVu\ Sans\ Mono:h11
colorscheme chronon

" position
winpos 0 878

" size
set co=124
set lines=64

" smaller or bigger?
map <Leader>-- :set co=110<CR>
map <Leader>--- :set co=166<CR>

" hilight column widths
set colorcolumn=81,101

" no toolbar and menus.
set guioptions-=T
set guioptions-=m

" no scrollbar
set guioptions-=rL

" show tabbar
set showtabline=2

set cursorline
set ttyfast
set relativenumber
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

au FileType markdown set co=110
