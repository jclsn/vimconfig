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

" Rainbow configuration
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained', 
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], 
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody', 
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow', 
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
\		},
\		'css': 0
\	}
\}

au FileType * RainbowToggleOff
au FileType json RainbowToggleOn
au FileType jsonc RainbowToggleOn
au FileType cpp RainbowToggleOn

