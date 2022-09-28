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

command -bar -nargs=+ KittyScrollback call s:KittyScrollback(<f-args>)

function s:KittyScrollback(topline, curline, curcol)
    " let us quit with a single keypress
    nnoremap <silent> q :<C-U>quitall!<CR>
    nnoremap <silent> i :<C-U>quitall!<CR>
    set laststatus=0
    set nonu
    set nornu
    set clipboard=autoselect,unnamedplus,exclude:cons\|linux

    " preserve cursor position
    let cmd = printf('normal! %sGzt%sG%s|', a:topline, a:curline, a:curcol)
    call timer_start(0, {-> execute(cmd)})
endfunction

let g:asyncrun_open = 6

if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
	let &t_SI = "\e[5 q"
	let &t_EI = "\e[2 q"
endif

