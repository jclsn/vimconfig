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

command Anonymize silent! call AnonymizeFunction()
command DeleteNonAscii :g/[^\x00-\x7f]/d
command ShowTrailingWhitespace :match ExtraWhitespace /\s\+$/
command AddToDictionary :CocCommand cSpell.addWordToUserDictionary
command GetHighlightUnderCursor call SynStack()
