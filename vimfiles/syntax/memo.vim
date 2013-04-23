" Vim syntax file
" Language:     memo
" Maintainer:   wada
" Last Change:  
" Version:      0.1
" Changes:      Add "undefined" as a type keyword
"
" TODO:
"  - 
  
"syntax region memoConstraintName start="[A-Z][A-Z0-9]*(" end=")"
syntax region memoLineComment start=+//+ end=+$+
syntax region memoComment start=+/\*+ end=+\*/+
syn case match "小文字と大文字を区別する
"syn match memoNumber /\<-\=\d\+L\=\>\|\<0[xX]\x\+\>/
"syntax region memoFunction start=+(+ end=+)+ nextgroup=memoDefine skipwhite
"syntax match memoFunction ++ contains=memoDefine skipwhite
syntax match memoAlways +\[\]+
syntax match memoDefine +<=>+
syntax match memoWeeker +<<+
syn match memoNumber "-\=\<\d\+\>" contained display
syn match memoNumber "-\=\<\d\+\>" contained display
highlight link memoLineComment Comment
highlight link memoComment Comment
highlight link memoFunction Function
highlight link memoAlways Tag
highlight link memoDefine Define
highlight link memoWeeker Identifier
highlight link memoNumber Number
"highlight link memoConstraintName Function
"highlight link memoNumber Define
