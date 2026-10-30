function! AnonymizeFunction()
  :%s/jan/user/g
endfunction

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction

command Anonymize silent! call AnonymizeFunction()
command DeleteNonAscii :g/[^\x00-\x7f]/d
command HighlightStack call SynStack()
command HighlightGroup call SynGroup()

function! MixxxIssue()
  let l:issue = expand('<cword>')
  let l:mixxx_issue_url = "https://github.com/mixxxdj/mixxx/issues/" .. l:issue
  call dist#vim9#Open(l:mixxx_issue_url)
endfunction
command MixxxIssue call MixxxIssue()

function! CloseOtherBuffersKeepFern()
  let l:cur = bufnr('%')
  let l:buffers = getbufinfo({'buflisted': 1})

  for l:buf in l:buffers
    let l:bn = l:buf.bufnr
    if l:bn != l:cur && getbufvar(l:bn, '&filetype') !=# 'fern'
      execute 'bd' l:bn
    endif
  endfor
endfunction

command! Bclean call CloseOtherBuffersKeepFern()
