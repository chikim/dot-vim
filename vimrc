set nocompatible

" pathogen
call pathogen#infect()
call pathogen#helptags()

filetype plugin on

set encoding=utf-8

set listchars=tab:▸\ ,eol:¬,trail:·

let mapleader = ","
set directory=/tmp/

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

nnoremap n nzzzv
nnoremap N Nzzzv

" highlight matching parens
set showmatch
set matchtime=2

" tab complete menu
set wildmenu
set wildmode=longest,list,full

" ignore (mostly for command-t)
set wildignore+=*.pyc,*.tmp

" tabs: spaces VS tabs... 
" CakePHP coding standard (hard tab) 
" set noexpandtab
" PEAR and Zend coding standard (indent of 4 spaces, with no tabs):
" set expandtab

set shiftwidth=4
set softtabstop=4
set tabstop=4

set smartindent
set linebreak

" using tabs, not spaces as default (expandtab default is off) 
"set noexpandtab

" tabs, not spaces for php, ctp
"au BufEnter,BufRead *.php,*.ctp setlocal noexpandtab

" spaces NOT tabs for python
au FileType python setl softtabstop=4 shiftwidth=4 tabstop=4 textwidth=80 expandtab

" indent 2 spaces for ruby
au FileType ruby,yaml setl softtabstop=2 tabstop=2 expandtab

au FileType scss setl tabstop=2

au FileType markdown setl spell

set wrap
set textwidth=80
set formatoptions=qrnc1

set ttyfast

" save on losing focus
"au FocusLost * :wa

" always show the status bar
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
au BufWritePre *.php setlocal binary
au BufWritePre *.php setlocal noeol
au BufWritePost *.php setlocal nobinary

"" highlight trailing whitespace for certain types of files
"au InsertEnter *.php,*.css,*.py match ExtraWhitespace /\s\+\%#\@<!$/
"au BufRead *.php,*.css,*.py match ExtraWhitespace /\s\+$/
"hi ExtraWhitespace ctermbg=red guibg=#990000
"au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=#990000

" bye-bye trailing whitespaces for certain types of files
autocmd BufWritePre *.php,*.css :call <SID>StripTrailingWhitespaces()

au BufRead,BufNewFile *.ctp set filetype=php

" Command-T plugin
let g:CommandTMaxHeight=25

" syntastic
let g:syntastic_auto_loc_list=1
"let g:syntastic_quiet_warnings=1
"let g:syntastic_disabled_filetypes=['html']
let g:syntastic_mode_map = { 'mode': 'passive',
						   \ 'active_filetypes': [],
						   \ 'passive_filetypes': ['html'] }

" vim-pep8 all the time, otherwise it's F6
" au BufEnter,Bufread *.py call Pep8()

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

" cakephp 
au BufEnter,BufRead {controllers,models,views,plugins,lib}/* set ft=php.cakephp
au BufEnter,BufRead {Controller,Model,View,Plugin,Lib}/* set ft=php.cakephp
"au BufEnter,BufRead *.ctp set ft=php.cakephp
au FileType php,php.cakephp set commentstring=//\%s 
au FileType html set commentstring=<!--%s--> 

" markdown
au BufEnter,Bufread *.mkd,*.md,*.mdown,*.markdown setlocal tw=0

" PHP parser check (CTRL-L)
":autocmd FileType php noremap <C-L> :!php -l %<CR>
"map <Leader>w :w\| !php -l %<CR>

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

map <Leader>ibd <ins><CR><esc>

" for commentary plugin
map <Leader>\h :set commentstring=<!--%s--> <CR>
map <Leader>\p :set commentstring=//\%s <CR>

" Command-T mapping changes (enter to open in new tab, ctrl-t for current
let g:CommandTAcceptSelectionMap='<C-t>'
let g:CommandTAcceptSelectionTabMap='<CR>'

" move visual selected blocks more then once
vnoremap < <gv
vnoremap > >gv

" omni-completion in a virtualenv for django
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

"let python_highlight_all = 1

" functions
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" preview reStructuredText with :Rst
:command Rst :silent !rst2html.py % > /tmp/rstprev.html && open /tmp/rstprev.html

let loaded_matchparen = 1
let g:Powerline_symbols = 'unicode'
