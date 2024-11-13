" ++++++++++++++++++++++++************************
"                       Theme settings
" ++++++++++++++++++++++++************************
let g:airline_powerline_fonts = 1
colorscheme spaceduck
set background=dark

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

" Link CoC semantic tokens to unused highlight
if has_key(plugs, 'coc.nvim')
	hi link CocSemTypeComment CocUnusedHighlight
endif

" Use dark gray for tabs and linebreaks
hi SpecialKey guibg=NONE ctermbg=NONE guifg=#30365F ctermfg=237

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
" hi Comment guifg=#484f7a ctermfg=141
" hi LineNr guifg=#484f7a ctermfg=141
" hi NonText guifg=#30365F ctermfg=234
" hi ExtraWhiteSpace guibg=#30365F ctermbg=234
" hi DiffAdd guibg=NONE ctermfg=NONE
" hi DiffChange guibg=NONE ctermbg=NONE
" hi DiffDelete guibg=NONE ctermbg=NONE
" hi DiffText guibg=NONE ctermbg=NONE
" hi SignColumn guibg=NONE ctermbg=NONE

" hi Directory guifg=#484f7a ctermfg=141
" hi folded ctermbg=none ctermfg=gray
   
""Force gray folds
" hi Folded ctermbg=None ctermfg=244
" hi folded ctermbg=none ctermfg=gray

" Indents
let g:indentLine_char = '▏'
let g:indentLine_enabled = 0

if has_key(plugs, 'fern.vim')
	hi GlyphPaletteDirectory guifg=#00a3cc ctermfg=38
endif
