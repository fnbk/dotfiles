" display current filetype: :set filetype?

"
" Comments
"

syn match dockerfileComment "#.*$"
hi link dockerfileComment Comment

"
" automatic comment insertion
"

setlocal fo+=cro

