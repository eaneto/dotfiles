if exists("b:current_syntax")
    finish
endif

unlet b:current_syntax
syntax include @SQL syntax/sql.vim

syn region SQLEmbedded contains=@SQL containedin=pythonString,pythonRawString contained start=+\C\v-- SQL+ end=+whatever+

let b:current_syntax = "pysql2"

