"set gfn=DejaVu\ Sans\ Mono:h11
set gfn=Menlo:h13
set background=dark
colorscheme solarized

" position
winpos 0 878

" size
set co=104
set lines=55

set linebreak

" hilight column widths
set colorcolumn=81

" no toolbar and menus.
set guioptions-=T
set guioptions-=m

" no scrollbar
set guioptions-=rL

" show tabbar
set showtabline=2

set cursorline

" ignore in gui only 
set wildignore+=_site/**

" cycle though tabs with Ctrl-Tab
nmap <C-Tab> :tabnext<CR>
map <C-Tab> :tabnext<CR>
imap <C-Tab> <C-O>:tabnext<CR>

if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
    "set transp=1
endif

" save when focus is lost
au FocusLost * :wa
