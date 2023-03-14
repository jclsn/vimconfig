" Author        : Jan Claussen
" Created       : 08/04/2022
" License       : MIT
" Description   : Custom commands

function AnonymizeFunction()
    :%s/jan/user/g
    :%s/AERQ In Seat Display Proto B (DT)/Module B/g
    :%s/AERQ/Somecompany/g
    :%s/aerq/somecompany/g
    :%s/ISD/Device/g
    :%s/isd/device/g
    :%s/In Seat Display/Device/g
    :%s/in seat display/device/g
endfunction

command Anonymize silent! call AnonymizeFunction()
command DeleteChinese :g/[^\x00-\x7f]/d
command Glog :Git log --oneline -500
command ShowTrailingWhitespace :match ExtraWhitespace /\s\+$/



function! Csc()
  cscope find c <cword>
endfunction
command! Csc call Csc()

cs add cscope.out

nnoremap <leader>r ciw<c-r>=system('perl -e "printf(qq[%02d], int(rand(60 - 0)))"')<cr><esc>



