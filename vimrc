scriptencoding utf-8
set fileencodings=utf-8

let mapleader = ","
set directory=/tmp/

set nocompatible
syntax on
set nobackup

" no bells
set vb t_vb=

" non-blinking cursor
set guicursor+=a:blinkon0

" search and show matches as you type
set incsearch

" highlight matching parens
set showmatch

" tab complete menu
set wildmenu
set wildmode=longest,list,full

" pathogen
call pathogen#runtime_append_all_bundles()

" filetype-specific indenting and plugins (off initiall to force reload)
filetype off
filetype plugin indent on

" indent 4
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent

" always show the status bar and line nums
set laststatus=2
set number

" auto read when a file is changed from elsewhere
set autoread

" make backspace work in insert mode (not needed for MavVim)
set backspace=indent,eol,start

"set term=xterm
set cmdheight=2
set hlsearch


" bye-bye eols
:autocmd BufWritePre *.php setlocal binary
:autocmd BufWritePre *.php setlocal noeol
:autocmd BufWritePost *.php setlocal nobinary

" highlight long lines (soft limit: 80, hard limit: 100)
:au BufWinEnter *.php,*.py let w:m1=matchadd('Search', '\%<101v.\%>80v', -1)
:au BufWinEnter *.php,*.py let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

" highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
hi ExtraWhitespace ctermbg=red guibg=#990000
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=#990000

" bye-bye trailing whitespaces from lines
autocmd FileType php,css autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" grep.vim plugin
let Grep_Skip_Dirs = 'tmp .git'
let Grep_Skip_Files = '.git*'
let Grep_Xargs_Path = '/opt/local/bin/gxargs'

" Command-T plugin
let g:CommandTMaxHeight=25

" status bar format
runtime! statusbar.vim

" language specific omnifunctions
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType vim set omnifunc=syntaxcomplete#Complete

" markdown
autocmd BufRead *.mkd,*.md,*.mdown,*.markdown set ai formatoptions=tcroqn2 comments=n:&gt;

" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!php -l %<CR>

map <Leader>, :NERDTreeToggle<cr>

" recursive search for word under cursor
" silent!grep -R chronon *
" vimgrep /chronon/gj ** | cw
" Ack chronon
map <Leader>g :noautocmd execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" turn off search highlighting
map <silent> <leader>nh :nohls <CR>

" manually trim all trailing whitespace
map <Leader>tws :%s/\s\+$//<CR>
