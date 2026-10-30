" Upload the lines to a pastebin and copy the returned URL to the clipboard
function! s:Paste(cmd) range abort
  let l:url = trim(system(a:cmd, getline(a:firstline, a:lastline)))
  if v:shell_error
    echohl ErrorMsg | echom 'Paste failed: ' . l:url | echohl None
    return
  endif
  if has('clipboard')
    let @+ = l:url
  elseif executable('xsel')
    call system('xsel -ib', l:url)
  endif
  echo l:url
endfunction

command! -range=% SP <line1>,<line2>call <SID>Paste('curl -sF "sprunge=<-" http://sprunge.us')
command! -range=% CL <line1>,<line2>call <SID>Paste('curl -sF "clbin=<-" https://clbin.com')
command! -range=% VP <line1>,<line2>call <SID>Paste('curl -sF "text=<-" http://vpaste.net')
command! -range=% PB <line1>,<line2>call <SID>Paste('curl -sF "c=@-" "https://ptpb.pw/?u=1"')
command! -range=% IX <line1>,<line2>call <SID>Paste('curl -sF "f:1=<-" http://ix.io')
command! -range=% EN <line1>,<line2>call <SID>Paste('curl -sF "file=@-;" https://envs.sh')
command! -range=% TB <line1>,<line2>call <SID>Paste('nc termbin.com 9999')
