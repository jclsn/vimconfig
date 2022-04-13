" Author        : Jan Claussen
" Created       : 08/04/2022
" License       : MIT
" Description   : Custom commands

function AnonymizeFunction()
    :%s/eppendorf/custom/g
    :%s/vti1/my-machine/g
    :%s/vti2/my-machine/g
    :%s/claussenj/user/g
endfunction

command Anonymize silent! call AnonymizeFunction()

