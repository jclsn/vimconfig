command -bar -nargs=+ KittyScrollback call s:KittyScrollback(<f-args>)

function s:KittyScrollback(topline, curline, curcol)
    " let us quit with a single keypress
    nnoremap <silent> q :<C-U>quitall!<CR>

    " preserve cursor position
    let cmd = printf('normal! %sGzt%sG%s|', a:topline, a:curline, a:curcol)
    call timer_start(0, {-> execute(cmd)})
endfunction


