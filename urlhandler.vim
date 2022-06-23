" Script to open URLs under the cursor
function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    exec "silent !xdg-open '".s:uri."'" | redraw!
  else
    echo "No URI found in line."
  endif
endfunction
nnoremap <leader>u :call HandleURL()<CR>




