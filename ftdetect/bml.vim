" BML filetype file
"if exists("did_load_filetypes")
"  finish
" endif
" augroup filetypedetect
"  au! BufRead,BufNewFile *.bml    setfiletype bml
" augroup END

au BufRead,BufNewFile *.bml  setfiletype bml
