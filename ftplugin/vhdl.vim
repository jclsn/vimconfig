setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab

" augroup VhdlConceal
"   autocmd!
"   autocmd BufEnter *.vhdl,*.vhd syntax match vhdlArrow /<=/ conceal cchar=⇐
"   autocmd BufEnter *.vhdl,*.vhd syntax match vhdlArrow /=>/ conceal cchar=⇒
"   autocmd BufEnter *.vhdl,*.vhd setlocal conceallevel=2 concealcursor=nc
"   autocmd BufEnter *.vhdl,*.vhd hi! link Conceal Operator
" augroup END
