scriptencoding utf-8
set fileencodings=utf-8

let mapleader = ","
set directory=/tmp/

set nocompatible
syntax on
set nobackup

set ruler
set scrolloff=3

" no bells
set vb t_vb=

" non-blinking cursor
set guicursor+=a:blinkon0

" search and show matches as you type
set incsearch

" highlight matching parens
set showmatch
set matchtime=2

" tab complete menu
set wildmenu
set wildmode=longest,list,full

" ignore (mostly for command-t)
set wildignore+=*.pyc,*.tmp

filetype off
" pathogen
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
filetype plugin indent on

" tabs: spaces VS tabs... 
" CakePHP and Lithium coding standard (hard tab) 
" set noexpandtab
" PEAR and Zend coding standard (indent of 4 spaces, with no tabs):
" set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" using spaces, not tabs as default
set expandtab

" tabs, not spaces for php, ctp
au BufEnter,BufRead *.php,*.ctp setlocal noexpandtab

" spaces NOT tabs for python
" au BufEnter,BufRead *.py setlocal expandtab

" indent 2 for ruby
au BufEnter,BufRead *.rb setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

set autoindent

set wrap
set textwidth=79
set formatoptions=qrnoc

set ttyfast

" save on losing focus
"au FocusLost * :wa

" always show the status bar
set laststatus=2

if has("gui_macvim")
    set relativenumber
    "set number
else
    set number
endif

" auto read when a file is changed from elsewhere
set autoread

" make backspace work in insert mode (not needed for MavVim)
set backspace=indent,eol,start

"set term=xterm
set cmdheight=2
set hlsearch

" bye-bye eols
au BufWritePre *.php setlocal binary
au BufWritePre *.php setlocal noeol
au BufWritePost *.php setlocal nobinary

" highlight long lines (soft limit: 80, hard limit: 100)
"au BufWinEnter *.php let w:m1=matchadd('Search', '\%<101v.\%>80v', -1)
"au BufWinEnter *.php let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

"" highlight trailing whitespace for .php and .css files
au InsertEnter *.php,*.css match ExtraWhitespace /\s\+\%#\@<!$/
au BufRead,InsertLeave *.php,*.css match ExtraWhitespace /\s\+$/
hi ExtraWhitespace ctermbg=red guibg=#990000
au ColorScheme *.php,*.css highlight ExtraWhitespace ctermbg=red guibg=#990000

" bye-bye trailing whitespaces from .php and .css files
au FileType php,css au BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

au BufRead,BufNewFile *.ctp set filetype=php

" grep.vim plugin
"let Grep_Skip_Dirs = 'tmp .git'
"let Grep_Skip_Files = '.git*'
"let Grep_Xargs_Path = '/opt/local/bin/gxargs'

" Command-T plugin
let g:CommandTMaxHeight=25

" taglist.vim 
"let Tlist_Use_Right_Window = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Enable_Fold_Column = 0
"let Tlist_File_Fold_Auto_Close = 1

" syntastic
let g:syntastic_auto_loc_list=0
let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['html']

" status bar format
runtime! statusbar.vim

" don't show the complete menu preview, default is completeopt=menu,preview
set completeopt=menu

" language specific omnifunctions
au FileType python set omnifunc=pythoncomplete#Complete
au FileType php,ctp set omnifunc=phpcomplete#CompletePHP
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html,ctp set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType vim set omnifunc=syntaxcomplete#Complete


" cakephp snippets
"au FileType php set ft=php.cakephp

" markdown
au BufEnter,Bufread *.mkd,*.md,*.mdown,*.markdown setlocal tw=0

" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!php -l %<CR>
map <Leader>w :w\| !php -l %<CR>

map <Leader>, :NERDTreeToggle<cr>
map <Leader>. :TlistToggle<cr>

" recursive search for word under cursor
" silent!grep -R chronon *
" vimgrep /chronon/gj ** | cw
" Ack chronon
map <Leader>g :noautocmd execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" turn off search highlighting
map <silent> <leader>nh :nohls <CR>

" turn off php long line highlighting 
"map <leader>nhl :hi Search guibg=NONE guifg=NONE\| :hi ErrorMsg guibg=NONE guifg=NONE<CR>
map <leader>nhl :hi ErrorMsg guibg=NONE guifg=NONE<CR>

" manually trim all trailing whitespace
map <Leader>tws :%s/\s\+$//<CR>

" ghetto xml format
map <Leader>fxml :%s/></>\r</g <CR> gg=G

" ctrl space for omnicomplete
imap <C-Space> <C-x><C-o>

" Command-T mapping changes (enter to open in new tab, ctrl-t for current
let g:CommandTAcceptSelectionMap='<C-t>'
let g:CommandTAcceptSelectionTabMap='<CR>'

" EasyGrep config
" use the TrackExt mode 
let g:EasyGrepMode=2
" recursive on
let g:EasyGrepRecursive=1
" use system grep, no slow vimgrep
let g:EasyGrepCommand=1

" move visual selected blocks more then once
vnoremap < <gv
vnoremap > >gv

" omni-completion in a virtualenv for django
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

let python_highlight_all = 1
