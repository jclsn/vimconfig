" ++++++++++++++++++++++++************************
"                Miscellaneous settings
" ++++++++++++++++++++++++************************
set number
set relativenumber
set tabstop=4 shiftwidth=4
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
set wildoptions=pum
set mouse=a
set splitbelow
set noscrollbind
set nocursorbind
set backspace=indent,eol,start
set incsearch
set scrolloff=5

if has ('nvim')
    set undodir=~/.config/nvim/undodir
else
    set undodir=~/.vim/undodir
endif

let g:better_whitespace_ctermcolor='gray'
let g:better_whitespace_guicolor='gray'
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

let g:asyncrun_open = 6

if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
	let &t_SI = "\e[5 q"
	let &t_EI = "\e[2 q"
endif


let todoKeywords = [
			\ "Note",
			\ "note",
			\ "Notes",
			\ "notes",
			\ "Todo",
			\ "ToDo",
			\ "todo",
			\ "FixMe",
			\ "Fixme",
			\ "fixme",
			\ ]


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

