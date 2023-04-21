vim9script

set encoding=utf-8

call plug#begin('~/.vim/plugged')
Plug 'pineapplegiant/spaceduck'
call plug#end()

nnoremap q <Cmd>quitall!<CR>
nnoremap i <Cmd>quitall!<CR>
set nonu
set nornu
set termguicolors
set background=dark
colorscheme spaceduck
set clipboard=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set termwinscroll=100000

command -bar -nargs=+ KittyScrollback KittyScrollback(<f-args>)

def KittyScrollback(topline: string, curline: string, curcol: string)
	# let us quit with a single keypress
	# preserve cursor position
	
	var input_line_nr = str2nr(topline)
	var cursor_line = str2nr(curline)
	var cursor_column = str2nr(curcol)
	var last_line = line('$')
	sleep 100m
	call cursor(max([0, input_line_nr - 1]) + cursor_line, cursor_column)
enddef
