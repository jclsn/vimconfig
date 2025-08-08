function AnonymizeFunction()
	:%s/jan/user/g
	:%s/AERQ/Somecompany/g
	:%s/aerq/somecompany/g
	:%s/ISD/Device/g
	:%s/isd/device/g
	:%s/In Seat Display/Device/g
	:%s/in seat display/device/g
endfunction

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

command Anonymize silent! call AnonymizeFunction()
command DeleteNonAscii :g/[^\x00-\x7f]/d
command HighlightStack call SynStack()
command HighlightGroup call SynGroup()

function! MixxxIssue()
  let l:issue = expand('<cword>')
  let l:mixxx_issue_url = "https://github.com/mixxxdj/mixxx/issues/" .. issue
  silent! call system('xdg-open ' .. shellescape(mixxx_issue_url) .. ' &')
endfun
command MixxxIssue call MixxxIssue()
