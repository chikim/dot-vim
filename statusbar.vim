"set laststatus=2
"set statusline=\ "
"set statusline+=%f\ " file name
"set statusline+=[
"set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
"set statusline+=%{&fileformat}] " file format
"" set statusline+=\ %{GitBranch()}
"set statusline+=%h%1*%m%r%w%0* " flag
"set statusline+=%= " right align
"set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

"set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=[%n]\                        " buffer number
"set statusline+=%f\                          " file name
set statusline+=%t\                          " file name
"set statusline+=%-40f\
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\ \   " highlight
set statusline+=%-14.(%l\ of\ %L,\ col:\ %c%V%)\ %<%P        " offset
