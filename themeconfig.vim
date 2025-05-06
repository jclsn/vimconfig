" #########################################################
"                       Theme settings
" #########################################################
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
	hi CocErrorHighlight cterm=undercurl ctermul=202 gui=undercurl guisp=#ff5f00
	hi CocWarningHighlight cterm=undercurl ctermul=187 gui=undercurl guisp=#d7d7af
	" hi CocFloating guibg=NONE ctermbg=NONE guifg=Gray ctermfg=Gray
	" hi CocFloatBorder guibg=NONE ctermbg=NONE guifg=Gray ctermfg=Gray
	" let g:coc_borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']
endif

" For some reason LSP highlights have to get changed here
if has_key(plugs, 'lsp')
	hi LspDiagInlineError cterm=undercurl ctermul=202 gui=undercurl guisp=#ff5f00
	hi LspDiagInlineWarning cterm=undercurl ctermul=187 gui=undercurl guisp=#d7d7af
	hi LspDiagInlineInfo cterm=undercurl ctermul=187 gui=undercurl guisp=#d7d7af
	hi LspDiagInlineHint cterm=undercurl ctermul=187 gui=undercurl guisp=#d7d7af
	hi LspDiagVirtualError cterm=undercurl ctermul=202 gui=undercurl guisp=#ff5f00
	hi LspDiagVirtualWarning cterm=undercurl ctermul=187 gui=undercurl guisp=#d7d7af
	hi LspDiagVirtualInfo cterm=undercurl ctermul=187 gui=undercurl guisp=#d7d7af
	hi LspDiagVirtualHint cterm=undercurl ctermul=187 gui=undercurl guisp=#d7d7af
	hi LspDiagVirtualTextError guifg=lightred guibg=NONE
	hi LspDiagVirtualTextWarning guifg=orange guibg=NONE
	hi LspDiagVirtualTextInfo guifg=lightblue guibg=NONE
	hi LspDiagVirtualTextHint guifg=lightblue guibg=NONE
	hi link LspWriteRef Visual
	hi link LspReadRef Visual

	" hi LspHoverPopup guibg=NONE ctermbg=NONE guifg=Gray ctermfg=Gray
	" hi LspHoverPopupBorder guibg=NONE ctermbg=NONE guifg=Gray ctermfg=Gray
	" hi LspPeekPopup guibg=NONE ctermbg=NONE guifg=Gray ctermfg=Gray
	" hi LspPeekPopupBorder guibg=NONE ctermbg=NONE guifg=Gray ctermfg=Gray
	" hi LspSymbolMenuPopup guibg=NONE ctermbg=NONE guifg=Gray ctermfg=Gray
	" hi LspSymbolMenuPopupBorder guibg=NONE ctermbg=NONE guifg=Gray ctermfg=Gray
	" hi LspTypeHierarchyPopup guibg=NONE ctermbg=NONE guifg=Gray ctermfg=Gray
	" hi LspTypeHierarchyPopupBorder guibg=NONE ctermbg=NONE guifg=Gray ctermfg=Gray
	" hi PMenu guibg=NONE ctermbg=NONE
	" let g:LspSignatureHelpPopupBorder = []
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

if !has('gui_running')
	" Switch cursor between solid block and blinking beam when switching mode
	let &t_SI = "\e[5 q"  " Blinking beam - insert
	let &t_SR = "\e[3 q"  " Blinking underline - replace
	let &t_EI = "\e[2 q"  " Solid block - normal

	" Enable undercurl in the terminal
	let &t_Cs = "\e[4:3m"
	let &t_Ce = "\e[4:0m"
endif

