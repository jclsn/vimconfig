function AnonymizeFunction()
	:%s/jan/user/g
	:%s/AERQ/Somecompany/g
	:%s/aerq/somecompany/g
	:%s/ISD/Device/g
	:%s/isd/device/g
	:%s/In Seat Display/Device/g
	:%s/in seat display/device/g
endfunction

command Anonymize silent! call AnonymizeFunction()
command DeleteChinese :g/[^\x00-\x7f]/d
command Glog :Git log --oneline --decorate --graph -500 
command ShowTrailingWhitespace :match ExtraWhitespace /\s\+$/
