" ++++++++++++++++++++++++************************
"                       Theme settings
" ++++++++++++++++++++++++************************
"let g:airline_theme="spaceduck"
let g:airline_powerline_fonts = 1
"let g:rainbow_active = 1
colorscheme spaceduck
set background=dark
set termguicolors
set signcolumn=auto

"source ~/.vim/plugged/onedark.vim/colors/onedark.vim

"autocmd BufEnter * if getbufvar(bufnr('%'), '&buftype') == "term" | colorscheme default | endif

"Force transparent background
"hi Normal guibg=NONE ctermbg=NONE"
"hi LineNr guibg=NONE ctermbg=NONE"
"hi LineNrAbove guibg=NONE ctermbg=NONE"
"hi LineNrBelow guibg=NONE ctermbg=NONE"
"hi SignColumn guibg=NONE ctermbg=NONE"
"hi EndOfBuffer guibg=NONE ctermbg=NONE"

"hi airline_c guibg=NONE ctermbg=NONE
"hi airline_tabfill guibg=NONE ctermbg=NONE
"hi airline_b guibg=NONE ctermbg=NONE
"hi airline_a guibg=NONE ctermbg=NONE
   
"""Force comment color
hi Comment guifg=#484f7a ctermfg=141
hi LineNr guifg=#484f7a ctermfg=141
hi SpecialKey guibg=NONE ctermbg=NONE guifg=#30365F ctermfg=237
hi NonText guifg=#30365F ctermfg=234
hi ExtraWhiteSpace guibg=#30365F ctermbg=234
hi DiffAdd guibg=NONE ctermfg=NONE
hi DiffChange guibg=NONE ctermbg=NONE
hi DiffDelete guibg=NONE ctermbg=NONE
hi DiffText guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE

hi Directory guifg=#484f7a ctermfg=141
hi folded ctermbg=none ctermfg=gray
   
""Force gray folds
hi Folded ctermbg=None ctermfg=244
hi folded ctermbg=none ctermfg=gray

"" Correct Airline theme for Spaceduck
let s:inactive2 = [ "#484f7a", "#16172d", 234, 234 ]
let s:inactive1 = [ "#484f7a", "#16172d", 234, 234 ]
let s:inactive3 = [ "#484f7a", "#16172d", 234, 234 ]

" Indents
let g:indentLine_char = '▏'
let g:indentLine_enabled = 0
