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
	set undodir=/home/jan/.config/nvim/undodir
else
	set undodir=/home/jan/.vim/undodir
endif

" Cursor settings
let &t_SI = "\<Esc>]50;CursorShape=1;BlinkingCursorEnabled=0\x7"
let &t_EI = "\<Esc>]50;CursorShape=0;BlinkingCursorEnabled=0\x7"

let g:better_whitespace_ctermcolor='gray'
let g:better_whitespace_guicolor='gray'
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0



