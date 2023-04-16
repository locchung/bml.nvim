if exists("b:current_syntax")
    finish
endif

" Keyword
syntax keyword bmlKeyword Action
syntax keyword bmlKeyword Function
syntax keyword bmlKeyword while foreach for continue break
syntax keyword bmlKeyword if elsif else
syntax keyword bmlKeyword class return var useof valueof typeof entryof undefined absent


" Function
syntax keyword bmlFunction log string loadClass


" Comment
syntax match bmlComment "\v#.*$"

" Operator
syntax match bmlOperator "\v\*"
syntax match bmlOperator "\v/"
syntax match bmlOperator "\v\+"
syntax match bmlOperator "\v-"
syntax match bmlOperator "\v\?"
syntax match bmlOperator "\v\*\="
syntax match bmlOperator "\v/\="
syntax match bmlOperator "\v\+\="
syntax match bmlOperator "\v-\="
syntax match bmlOperator "\v\="


"
" Numbers (ints, longs, floats, complex)
"
syn match   bmlHexError    '\<0[xX]\x*[g-zG-Z]\+\x*[lL]\=\>' display
syn match   bmlOctError    '\<0[oO]\=\o*\D\+\d*[lL]\=\>' display
syn match   bmlBinError    '\<0[bB][01]*\D\+\d*[lL]\=\>' display

syn match   bmlHexNumber   '\<0[xX]\x\+[lL]\=\>' display
syn match   bmlOctNumber   '\<0[oO]\o\+[lL]\=\>' display
syn match   bmlBinNumber   '\<0[bB][01]\+[lL]\=\>' display

syn match   bmlNumberError '\<\d\+\D[lL]\=\>' display
syn match   bmlNumber      '\<\d[lL]\=\>' display
syn match   bmlNumber      '\<[0-9]\d\+[lL]\=\>' display
syn match   bmlNumber      '\<\d\+[lLjJ]\>' display

syn match   bmlOctError    '\<0[oO]\=\o*[8-9]\d*[lL]\=\>' display
syn match   bmlBinError    '\<0[bB][01]*[2-9]\d*[lL]\=\>' display

syn match   bmlFloat       '\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>' display
syn match   bmlFloat       '\<\d\+[eE][+-]\=\d\+[jJ]\=\>' display
syn match   bmlFloat       '\<\d\+\.\d*\%([eE][+-]\=\d\+\)\=[jJ]\=' display

syn match   bmlOctError    '\<0[oO]\=\o*\D\+\d*\>' display
syn match   bmlHexError    '\<0[xX]\x*[g-zG-Z]\x*\>' display
syn match   bmlBinError    '\<0[bB][01]*\D\+\d*\>' display

syn match   bmlHexNumber   '\<0[xX][_0-9a-fA-F]*\x\>' display
syn match   bmlOctNumber   '\<0[oO][_0-7]*\o\>' display
syn match   bmlBinNumber   '\<0[bB][_01]*[01]\>' display

syn match   bmlNumberError '\<\d[_0-9]*\D\>' display
syn match   bmlNumberError '\<0[_0-9]\+\>' display
syn match   bmlNumberError '\<0_x\S*\>' display
syn match   bmlNumberError '\<0[bBxXoO][_0-9a-fA-F]*_\>' display
syn match   bmlNumberError '\<\d[_0-9]*_\>' display
syn match   bmlNumber      '\<\d\>' display
syn match   bmlNumber      '\<[1-9][_0-9]*\d\>' display
syn match   bmlNumber      '\<\d[jJ]\>' display
syn match   bmlNumber      '\<[1-9][_0-9]*\d[jJ]\>' display

syn match   bmlOctError    '\<0[oO]\=\o*[8-9]\d*\>' display
syn match   bmlBinError    '\<0[bB][01]*[2-9]\d*\>' display

syn match   bmlFloat       '\.\d\%([_0-9]*\d\)\=\%([eE][+-]\=\d\%([_0-9]*\d\)\=\)\=[jJ]\=\>' display
syn match   bmlFloat       '\<\d\%([_0-9]*\d\)\=[eE][+-]\=\d\%([_0-9]*\d\)\=[jJ]\=\>' display
syn match   bmlFloat       '\<\d\%([_0-9]*\d\)\=\.\d\=\%([_0-9]*\d\)\=\%([eE][+-]\=\d\%([_0-9]*\d\)\=\)\=[jJ]\=' display


" String
syntax region bmlString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region bmlString start=/\v'/ skip=/\v\\./ end=/\v'/


" Mixing spaces and tabs also may be used for pretty formatting multiline
" statements
syn match bmlIndentError   '^\s*\%( \t\|\t \)\s*\S'me=e-1 display


" bolean
syn keyword bmlBoolean true false

"
" Function calls
"
syn match bmlFunctionCall '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\ze\%(\s*(\)'

" variable
" Identifier
syn match bmlParent "[({[\]})]" contained
syn match bmlParent "#\[" contained
syn match bmlVarSelector "\$" contained display
syn match bmlIdentifier "$\h\w*" contained contains=bmlVarSelector display
syn match bmlIdentifierSimply "${\h\w*}" contained display
syn region bmlIdentifierComplex matchgroup=bmlParent start="{\$"rs=e-1 end="}" contains=bmlIdentifier,bmlVarSelector,bmlIdentifierComplexP contained extend
syn region bmlIdentifierComplexP matchgroup=bmlParent start="\[" end="]" contained



highlight link bmlKeyword             Keyword
highlight link bmlFunction            Function
highlight link bmlComment             Comment
highlight link bmlString              String
highlight link bmlOperator            Operator
highlight link bmlIndentError         Error
highlight link bmlBoolean             Boolean
highlight link bmlNumber           Number
highlight link bmlHexNumber        Number
highlight link bmlOctNumber        Number
highlight link bmlBinNumber        Number
highlight link bmlFloat            Float
highlight link bmlNumberError      Error
highlight link bmlOctError         Error
highlight link bmlHexError         Error
highlight link bmlBinError         Error
highlight link bmlFunctionCall     Function
highlight link bmlInterpVarname    Identifier
highlight link bmlParent Delimiter
highlight link bmlVarSelector Operator
highlight link bmlIdentifier Identifier
highlight link bmlIdentifierSimply Identifier

let b:current_syntax = "bml"
