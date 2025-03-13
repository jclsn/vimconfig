set tabstop=4
set shiftwidth=4
set noexpandtab 

function! PreserveCursor(cmd)
    let l:save_pos = getpos(".")  " Save cursor position
    execute a:cmd
    call setpos(".", l:save_pos)  " Restore cursor position
endfunction

" Convert to shared_ptr
nnoremap <leader>tms :call PreserveCursor(':s/\vnew (\w+)\((.*)\)/std::make_shared<\1>(\2)/')<CR>
nnoremap <leader>tsp :call PreserveCursor(':s/\v(\w+)\*/std::shared_ptr<\1>/')<CR>

" Convert to unique_ptr
nnoremap <leader>tmu :call PreserveCursor(':s/\vnew (\w+)\((.*)\)/std::make_unique<\1>(\2)/')<CR>
nnoremap <leader>tup :call PreserveCursor(':s/\v(\w+)\*/std::unique_ptr<\1>/')<CR>

" Convert to weak_ptr
nnoremap <leader>twp :call PreserveCursor(':s/\v(\w+)\*/std::weak_ptr<\1>/')<CR>
