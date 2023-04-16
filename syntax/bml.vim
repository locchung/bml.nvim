if exists("b:current_syntax")
    finish
endif

syntax keyword bmlKeyword to Action
syntax keyword bmlKeyword to Function
highlight link bmlKeyword Keyword

let b:current_syntax = "bml"
