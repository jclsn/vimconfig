set tabstop=4
set shiftwidth=4
set noexpandtab 

function! PreserveCursor(cmd)
    let l:save_pos = getpos(".")  " Save cursor position
    execute a:cmd
    call setpos(".", l:save_pos)  " Restore cursor position
endfunction

so $MYVIMDIR/cpp-maps.vim
