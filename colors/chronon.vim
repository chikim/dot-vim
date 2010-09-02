" Vim colorscheme
" Maintainer: Gregory Gaskill <gregory@chronon.com>
" Last Change: 2010-08-21
" Version: 0.5

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "chronon"

" GUI
hi Cursor                 guifg=#000000 guibg=#cccccc
hi NonText                guibg=#062636
hi Normal                 guifg=#dddddd guibg=#103040
hi LineNr                 guifg=#999999 guibg=#062636
"hi StatusLine             guifg=#ffffff guibg=#006600 gui=bold
hi StatusLine             guifg=#dddddd guibg=#006666 gui=bold
hi StatusLineNC           guifg=#333333 guibg=#666666
hi ErrorMsg               guifg=#eeeeee guibg=#990000
hi Visual                 guifg=#336699 guibg=#ffffff gui=reverse
hi Title                  guifg=#cc66cc gui=bold
hi Search                 guifg=#ffffff guibg=#006699
hi WildMenu               guifg=#000000 guibg=#99ffff gui=bold
hi PMenu                  guifg=#ffffff guibg=#336699
hi PMenuSel               guifg=#eeeeee guibg=#003366
hi Question               guifg=#009900
hi MatchParen             guifg=NONE guibg=#003366 gui=bold
hi Folded                 guifg=#cccccc guibg=#663300

" cursorline
highlight CursorLine      guibg=#003853

" syntax
hi Identifier             guifg=#00ffff
hi Error                  guifg=#ffffff guibg=#993333
hi Statement              guifg=#99cc99 gui=none
hi Conditional            guifg=#33cc33
hi Operator               guifg=#3399ff

hi Macro                  guifg=#66cc66

hi Type                   guifg=#60ff60 gui=none
hi StorageClass           guifg=#6699cc
hi Structure              guifg=#cc99cc

hi Special                guifg=#ff9933 gui=bold
hi Delimiter              guifg=#ff9933 gui=none

" PHP specific
hi phpDefineClassName     guifg=#009900
hi phpType                guifg=#99ccff
hi phpVarSelector         guifg=#00cc00
hi phpFunctions           guifg=#ff6600
hi phpSpecialFunction     guifg=#ff6600

" CSS specific
hi cssClassName           guifg=#66cc66

"Comment

"Constant
"String
"Character
"Number
"Boolean
"Float

"Identifier

"Statement
"Conditional
"Repeat
"Label
"Operator
"Keyword
"Exception

"PreProc
"Include
"Define
"Macro (semi-colon)
"PreCondit

"Type
"StorageClass (public, private)
"Structure (class, extends)
"Typedef

"Special
"Tag
"SpecialChar
"Delimiter
"SpecialComment
"Debug

"phpDefineClassName (ProjectsController, AppController)
"phpType (array())
"phpAssign (=)
"phpVarSelector ($)
