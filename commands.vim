" Author        : Jan Claussen
" Created       : 08/04/2022
" License       : MIT
" Description   : Custom commands

function AnonymizeFunction()
    :%s/eppendorf/custom/g
    :%s/ep-eaf-//g
    :%s/meta-eaf/meta-custom/g
    :%s/eaf/project/g
    :%s/vti1/my-machine/g
    :%s/vti2/my-machine/g
    :%s/claussenj/user/g
    :%s/libepgateway/libcustom1/g
    :%s/epsettingsmanager/settingsmanager/g
endfunction

command Anonymize silent! call AnonymizeFunction()

command DeleteChinese :g/[^\x00-\x7f]/d
