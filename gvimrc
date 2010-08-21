set gfn=DejaVu\ Sans\ Mono:h11
colorscheme chronon

" no toolbar and menus.
set guioptions-=T
set guioptions-=m

" no scrollbar
set guioptions-=rL

" show tabbar
set showtabline=2

set cursorline

" cycle though tabs with Ctrl-Tab
nmap <C-Tab> :tabnext<CR>
map <C-Tab> :tabnext<CR>
imap <C-Tab> <C-O>:tabnext<CR>

" bind command-] to shift right
nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>

" bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<

if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
endif

