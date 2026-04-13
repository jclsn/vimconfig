" #########################################################
"                       Theme settings
" #########################################################
colorscheme spaceduck
set background=dark
set termguicolors

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

	hi LspPopup guibg=NONE ctermbg=NONE guifg=Gray ctermfg=Gray
	hi LspPopupBorder guibg=NONE ctermbg=NONE guifg=Gray ctermfg=Gray
	" hi PMenu guibg=NONE ctermbg=NONE
	" let g:LspSignatureHelpPopupBorder = []
endif

" Use dark gray for tabs and linebreaks
hi SpecialKey guibg=NONE ctermbg=NONE guifg=#30365F ctermfg=237

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
else
	" Fix undercurl on Windows terminal
	let &t_Us = "\e[4:2m"
	let &t_ds = "\e[4:4m"
	let &t_Ds = "\e[4:5m"
	let &t_Cs = "\e[4:3m"
	let &t_Ce = "\e[4:0m"
	let &t_8u = "\e[58:2::%lu:%lu:%lum"
endif
