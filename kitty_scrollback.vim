" Author        : Jan Claussen
" Created       : 24/10/2022
" License       : MIT
" Description   :
"
vim9script

command -bar -nargs=+ KittyScrollback KittyScrollback(<f-args>)

def KittyScrollback(topline: string, curline: string, curcol: string)
    # let us quit with a single keypress
    nnoremap q <Cmd>quitall!<CR>
    nnoremap i <Cmd>quitall!<CR>
	set nonu
	set nornu
	set laststatus=0
	set clipboard=autoselect,unnamedplus,exclude:cons\|linux


    # preserve cursor position
    var cmd: string = printf('normal! %sGzt%sG%s|', topline, curline, curcol)
    timer_start(0, (_) => execute(cmd))
enddef

