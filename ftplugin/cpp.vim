setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab

function! PreserveCursor(cmd)
  let l:save_pos = getpos(".")  " Save cursor position
  execute a:cmd
  call setpos(".", l:save_pos)  " Restore cursor position
endfunction

source $VIMHOME/cpp-maps.vim
