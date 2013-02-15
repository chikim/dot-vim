set nocompatible
set encoding=utf-8

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gregsexton/MatchTag'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-sensible'
Bundle 'edsono/vim-matchit'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
Bundle 'editorconfig/editorconfig-vim'

filetype plugin indent on

" these are set in sensible.vim
" syntax enable 
" set backspace=indent,eol,start
" set showmatch
" set incsearch
" set laststatus=2
" set ruler
" set wildmenu
" set scrolloff=3
" set autoread

set listchars=tab:▸\ ,eol:¬,trail:·
set number
set ttyfast
set cmdheight=2
set hlsearch

" no bells
set vb t_vb=

" non-blinking cursor
set guicursor+=a:blinkon0

" indent folding
set foldmethod=indent
set foldlevelstart=20

nnoremap n nzzzv
nnoremap N Nzzzv

" tab complete menu
set wildmode=longest,list,full
" ignore (mostly for ctrl-p)
set wildignore+=*.pyc,*.tmp,tmp/*

" tabs: spaces VS tabs... 
" CakePHP coding standard (hard tab) 
" set noexpandtab
" PEAR and Zend coding standard (indent of 4 spaces, with no tabs):
" set expandtab

set shiftwidth=4
set softtabstop=4
set tabstop=4

set linebreak

" using tabs, not spaces as default (expandtab default is off) 
"set noexpandtab

" spaces NOT tabs for python
au FileType python setl textwidth=80 expandtab

" indent 2 spaces for ruby, sass
au FileType ruby,yaml,scss setl softtabstop=2 tabstop=2 shiftwidth=2 expandtab

" indent 1 tab = 2 spaces for html
au FileType html,css setl softtabstop=2 tabstop=2 shiftwidth=2

" indent 1 tab = 2 spaces for CakePHP templates
au BufEnter,BufRead *.ctp setl softtabstop=2 tabstop=2 shiftwidth=2

set wrap
set textwidth=80
set formatoptions=qrnco1


" bye-bye eols
au BufWritePre *.php setlocal binary
au BufWritePre *.php setlocal noeol
au BufWritePost *.php setlocal nobinary

" bye-bye trailing whitespaces for certain types of files
autocmd BufWritePre *.php,*.css :call <SID>StripTrailingWhitespaces()

au BufRead,BufNewFile *.ctp setlocal filetype=php

" CtrlP
let g:ctrlp_max_height = 20
let g:ctrlp_open_new_file = 't'
let g:ctrlp_working_path_mode = 'a'

" syntastic
let g:syntastic_php_phpcs_args='--report=csv --standard=CakePHP'
map <Leader>sc :SyntasticCheck<cr>

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

" markdown
au BufEnter,Bufread *.mkd,*.md,*.mdown,*.markdown setlocal ft=markdown
au FileType markdown setl spell tw=100

" manually trim all trailing whitespace
map <Leader>tws :%s/\s\+$//<CR>

" ghetto xml format
map <Leader>fxml :%s/></>\r</g <CR> gg=G

" ctrl space for omnicomplete
imap <C-Space> <C-x><C-o>

" php doc
map <Leader>pd :call PhpDoc()<CR>

" Tagbar
let g:tagbar_autofocus = 1
nmap <Leader>, :TagbarOpen<CR>
nmap <Leader>. :TagbarClose<CR>

" move visual selected blocks more then once
vnoremap < <gv
vnoremap > >gv

"Gundo.vim
nnoremap <F6> :GundoToggle<CR>

" omni-completion in a virtualenv for django
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

" functions
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

let mapleader = ","
let loaded_matchparen = 1
let g:Powerline_symbols = 'unicode'
" let g:Powerline_symbols = 'fancy'

au BufRead,BufNewFile *.php nnoremap <buffer> <C-P> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <C-P> :call PhpDocRange()<CR>

" ack -al 'pattern' | xargs perl -pi -E 's/pattern/replacement/g'
