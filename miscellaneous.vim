" ++++++++++++++++++++++++************************
"                Miscellaneous settings
" ++++++++++++++++++++++++************************
set number
set relativenumber
set tabstop=4 shiftwidth=4 expandtab
set softtabstop=4
set shiftwidth=4
"set noexpandtab
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

if has ('nvim')
    set undodir=/home/claussenj/.config/nvim/undodir
else
    set undodir=/home/claussenj/.vim/undodir
endif

" Cursor settings
let &t_SI = "\<Esc>]50;CursorShape=1;BlinkingCursorEnabled=0\x7"
let &t_EI = "\<Esc>]50;CursorShape=0;BlinkingCursorEnabled=0\x7"

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

