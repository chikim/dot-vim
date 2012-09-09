set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'gregsexton/MatchTag'
Bundle 'mileszs/ack.vim'
Bundle 'wincent/Command-T'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'

filetype plugin indent on

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

" indent folding
set foldmethod=indent
set foldlevelstart=20

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
set wildignore+=*.pyc,*.tmp,tmp/*

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

" spaces NOT tabs for python
au FileType python setl textwidth=80 expandtab

" indent 2 spaces for ruby
au FileType ruby,yaml,scss setl softtabstop=2 tabstop=2 shiftwidth=2 expandtab

" au BufEnter,BufRead *.ctp setlocal softtabstop=2 shiftwidth=2 tabstop=2


set wrap
set textwidth=80
set formatoptions=qrnco1

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
let g:syntastic_auto_jump = 1
let g:syntastic_mode_map = { 'mode': 'passive',
							\'active_filetypes': [],
						    \'passive_filetypes': [] }

let g:syntastic_phpcs_conf = "--standard=CakePHP"
map <Leader>sc :SyntasticCheck<cr>

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
" au BufEnter,BufRead {controllers,models,views,plugins,lib}/* set ft=php.cakephp
" au BufEnter,BufRead {Controller,Model,View,Plugin,Lib}/* set ft=php.cakephp

" markdown
au BufEnter,Bufread *.mkd,*.md,*.mdown,*.markdown setlocal ft=markdown
au FileType markdown setl spell tw=100

" PHP parser check (CTRL-L)
":autocmd FileType php noremap <C-L> :!php -l %<CR>
"map <Leader>w :w\| !php -l %<CR>


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

" Tagbar
let g:tagbar_autofocus = 1
nmap <Leader>, :set co=140 <CR> :TagbarOpen<CR>
nmap <Leader>. :set co=120 <CR> :TagbarClose<CR>

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
" :command Rst :silent !rst2html.py % > /tmp/rstprev.html && open /tmp/rstprev.html

let loaded_matchparen = 1
let g:Powerline_symbols = 'unicode'

au BufRead,BufNewFile *.php inoremap <buffer> <C-P> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <C-P> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <C-P> :call PhpDocRange()<CR>

" compile scss/jekyll sites if the _bin/build script exists on .scss save
function! BuildSite()
	if filereadable("_bin/build")
		silent !_bin/build
	endif
endfunction
	
au BufWritePost *.scss call BuildSite()
