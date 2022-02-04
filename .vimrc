set encoding=utf-8

call plug#begin('~/.vim/plugged')
so ~/.vim/pluginlist.vim
call plug#end()

" ++++++++++++++++++++++++************************
"						User
" ++++++++++++++++++++++++************************
let g:tmpl_author_email = 'claussen.j@eppendorf.de'
let g:tmpl_author_name = 'Jan Claussen'

" ++++++++++++++++++++++++************************
"                    Folding
" ++++++++++++++++++++++++************************

" Auto save and load views
au BufWinLeave *.* silent! mkview
au BufWinEnter *.* silent! loadview
set foldmethod=syntax
set foldlevelstart=99

" ++++++++++++++++++++++++************************
"                Miscellaneous settings
" ++++++++++++++++++++++++************************
set number
set relativenumber
set tabstop=4 shiftwidth=4 expandtab
set softtabstop=4
set shiftwidth=4
set noexpandtab
set undofile   " Maintain undo history between sessions
set shell=zsh
set ttimeoutlen=0
set timeoutlen=500
set noswapfile
set wildmenu
set wildmode=longest:full,full
set mouse=a
set splitbelow

if has ('nvim')
	set undodir=~/.config/nvim/undodir
else
	set undodir=~/.vim/undodir
endif

" Cursor settings
let &t_SI = "\<Esc>]50;CursorShape=1;BlinkingCursorEnabled=0\x7"
let &t_EI = "\<Esc>]50;CursorShape=0;BlinkingCursorEnabled=0\x7"

let g:better_whitespace_ctermcolor='gray'
let g:better_whitespace_guicolor='gray'
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" ++++++++++++++++++++++++***********************_
"               Source large configurations
" ++++++++++++++++++++++++************************
"so ~/.vim/ultisnipsrc.vim
"so ~/.vim/ycmrc.vim
"so ~/.vim/vimtexrc.vim
so ~/.vim/vimspectorrc.vim
so ~/.vim/fugitiverc.vim
so ~/.vim/cocrc.vim
so ~/.vim/autocommands.vim
so ~/.vim/ctags.vim
so ~/.vim/remaps.vim
so ~/.vim/urlhandler.vim
so ~/.vim/themeconfig.vim


