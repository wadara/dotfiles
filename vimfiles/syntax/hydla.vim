" Vim syntax file
" Language:     HydLa
" Maintainer:   wada
" Last Change:  
" Version:      0.1
" Changes:      Add "undefined" as a type keyword
"
" TODO:
"  - 
  
"syntax region hydlaConstraintName start="[A-Z][A-Z0-9]*(" end=")"
syntax region hydlaLineComment start=+//+ end=+$+
syntax region hydlaComment start=+/\*+ end=+\*/+
syn case match "小文字と大文字を区別する
"syn match hydlaNumber /\<-\=\d\+L\=\>\|\<0[xX]\x\+\>/
"syntax region hydlaFunction start=+(+ end=+)+ nextgroup=hydlaDefine skipwhite
"syntax match hydlaFunction ++ contains=hydlaDefine skipwhite
syntax match hydlaAlways +\[\]+
syntax match hydlaDefine +<=>+
syntax match hydlaWeeker +<<+
syn match hydlaNumber "-\=\<\d\+\>" contained display
syn match hydlaNumber "-\=\<\d\+\>" contained display
highlight link hydlaLineComment Comment
highlight link hydlaComment Comment
highlight link hydlaFunction Function
highlight link hydlaAlways Tag
highlight link hydlaDefine Define
highlight link hydlaWeeker Identifier
highlight link hydlaNumber Number
"highlight link hydlaConstraintName Function
"highlight link hydlaNumber Define
