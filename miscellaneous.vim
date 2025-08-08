" ++++++++++++++++++++++++************************
"                Miscellaneous settings
" ++++++++++++++++++++++++************************
"
source $MYVIMDIR/kernel-style.vim

set number
set relativenumber
set signcolumn=yes
set undofile   " Maintain undo history between sessions
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
set incsearch
set scrolloff=5
set tags=./tags;,tags;./.tags;,.tags;
set cursorline
set foldmethod=syntax
set foldnestmax=99
set foldlevel=99
set noautochdir
set viewoptions-=curdir
set nolist
set listchars=tab:▸·,eol:¬
set exrc
set nocursorline

if has('unix') && !has('win32')
	set shell=zsh
endif

let g:c_syntax_for_h=1
let g:asmsyntax = 'nasm'
let filetype_asm = 'nasm'

let g:pairtools_samplefile_path='$MYVIMDIR/plugged/vim-PairTools/ftplugin'

if has ('nvim')
	set undodir=~/.config/nvim/undodir
else
	set undodir=$MYVIMDIR/undodir
end

let g:better_whitespace_ctermcolor=178
let g:better_whitespace_guicolor='firebrick4'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=0
let g:strip_whitespace_confirm=0

let g:asyncrun_open = 6
let g:startify_change_to_dir = 0


if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
	let &t_SI = "\e[5 q" | let &t_EI = "\e[2 q"
else
	let &t_SI = "\e[5 q"
	let &t_EI = "\e[2 q"
endif


let todoKeywords = [
			\ "dummy",
			\ "DUMMY",
			\ "IMPORTANT NOTE",
			\ "Important Note",
			\ "important note",
			\ "NOTE",
			\ "Note",
			\ "note",
			\ "NOTES",
			\ "Notes",
			\ "notes",
			\ "Todo",
			\ "ToDo",
			\ "todo",
			\ "FIXME",
			\ "FixMe",
			\ "Fixme",
			\ "fixme",
			\ "IMPROVEME",
			\ "ImproveMe",
			\ "Improveme",
			\ "improveme",
			\ ]


if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

if has('nvim')
	if has('unix') && !has('win32')
	    let g:python3_host_prog = '/usr/bin/python3'
	endif
else
    set pyxversion=3
endif

if $TERM == 'screen-256color' " or w/e your TERM is in tmux
	  exec "set <S-F11>=\<Esc>[23;2~"
endif

" Always use make -j$(nproc) when using :make
if has('unix') && !has('win32')
	let &makeprg = "make -j" . system('nproc')
endif

" Fix cursor on Windows
if exists('$WT_SESSION') || $TERM_PROGRAM ==# 'Windows_Terminal'
	"set t_SI=[5 q  " Insert mode: blinking beam
	"set t_EI=[1 q  " Normal mode: blinking block
	"set t_SR=[3 q  " Replace mode: blinking underscore
	let &t_SI = "\e[5 q"
	let &t_EI = "\e[1 q"
	let &t_SR = "\e[3 q"
endif
