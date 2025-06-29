set encoding=utf-8
set nocompatible

call plug#begin('$MYVIMDIR/plugged')
Plug 'pineapplegiant/spaceduck'
Plug 'jasonccox/vim-wayland-clipboard'
call plug#end()

colorscheme spaceduck

set nonu
set nornu
set termguicolors
set background=dark
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set termwinscroll=10000

nnoremap q <Cmd>quitall!<CR>
nnoremap i <Cmd>quitall!<CR>
vnoremap y "+y
nnoremap y "+y

command -bar -nargs=+ PreserveCursorPosition call s:PreserveCursorPosition(<f-args>)

function s:PreserveCursorPosition(topline, curline, curcol)
	let input_line_nr = str2nr(a:topline)
	let cursor_line = str2nr(a:curline)
	let cursor_column = str2nr(a:curcol)
	let last_line = line('$')
	sleep 100m
	call cursor(max([0, input_line_nr - 1]) + cursor_line, cursor_column)
endfunction
