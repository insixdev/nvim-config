if exists("b:current_syntax")
  finish
endif

syntax clear
syn case ignore

" Reglas de coincidencia
syn match compileSuccess "^\s*passed.*"
syn match compileFailure "^\s*failed.*"
syn match compileError "^\s*E\s\+.*"
syn match compileLocation "\.\?[/a-zA-Z0-9_.-]\+:\d\+\(:\d\+\)\?"
syn match compileErrorWord "\<error\(\[[^]]*\]\)\?:"
syn match compileWarningWord "\<warning\(\[[^]]*\]\)\?:"

" Enlaces de resaltado (Asegúrate de usar nombres estándar)
hi link compileSuccess DiffAdd
hi link compileFailure DiffDelete
hi link compileError ErrorMsg
hi link compileErrorWord Error
hi link compileWarningWord Todo
hi link compileLocation Directory

let b:current_syntax = "compile"
