if exists("b:current_syntax")
    finish
endif

runtime! other_language_syntax/*.vim

let b:current_syntax = "bml"
