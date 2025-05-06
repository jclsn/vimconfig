let lspOpts = #{
	\   aleSupport: v:false,
	\   autoComplete: v:true,
	\   autoHighlight: v:true,
	\   autoHighlightDiags: v:true,
	\   autoPopulateDiags: v:true,
	\   completionMatcher: 'case',
	\   completionMatcherValue: 1,
	\   diagSignErrorText: '❗',
	\   diagSignHintText: '💡',
	\   diagSignInfoText: '💡',
	\   diagSignWarningText: '💡',
	\   diagSignPriority: {
	\       'Error': 100,
	\       'Warning': 99,
	\       'Information': 98,
	\       'Hint': 97
	\   },
	\   echoSignature: v:false,
	\   hideDisabledCodeActions: v:false,
	\   highlightDiagInline: v:true,
	\   hoverInPreview: v:false,
	\   ignoreMissingServer: v:true,
	\   keepFocusInDiags: v:true,
	\   keepFocusInReferences: v:true,
	\   completionTextEdit: v:true,
	\   diagVirtualTextAlign: 'above',
	\   noNewlineInCompletion: v:false,
	\   popupBorder: v:true,
	\   popupBorderSignatureHelp: v:true,
	\   omniComplete: v:null,
	\   outlineOnRight: v:true,
	\   outlineWinSize: 50,
	\   semanticHighlight: v:false,
	\   showDiagInBalloon: v:false,
	\   showDiagInPopup: v:true,
	\   showDiagOnStatusLine: v:false,
	\   showDiagWithSign: v:true,
	\   showDiagWithVirtualText: v:true,
	\   showInlayHints: v:false,
	\   showSignature: v:true,
	\   snippetSupport: v:true,
	\   ultisnipsSupport: v:true,
	\   useBufferCompletion: v:true,
	\   usePopupInCodeAction: v:true,
	\   vsnipSupport: v:false,
	\   useQuickfixForLocations: v:false,
	\   bufferCompletionTimeout: 1,
	\   customCompletionKinds: v:false,
	\   completionKinds: {},
	\   filterCompletionDuplicates: v:true,
	\ }

autocmd User LspSetup call LspOptionsSet(lspOpts)

" Source all language servers
for file in split(glob('~/.vim/lsp/*.vim'), '\n')
	execute 'source' fnameescape(file)
endfor

" Enable language servers
let lspServers = []
call add(lspServers, bash)
call add(lspServers, bitbake)
call add(lspServers, clangd)
call add(lspServers, cmake)
call add(lspServers, efm)
call add(lspServers, ginko)
call add(lspServers, json)
call add(lspServers, julia)
call add(lspServers, marksman)
call add(lspServers, pyright)
call add(lspServers, rustanalyzer)
" call add(lspServers, sonarlint)
call add(lspServers, vhdl)
call add(lspServers, vim)

autocmd VimEnter * call LspAddServer(lspServers)

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

nnoremap <leader>qf :LspCodeAction<CR>
nnoremap <silent> <leader>pe :LspDiagPrev<CR>
nnoremap <silent> <leader>ne :LspDiagNext<CR>
nnoremap <silent> <leader>pd :LspPeekDefinition<CR>
nnoremap <silent> <leader>pdc :LspPeekDeclaration<CR>
nnoremap <silent> <leader>pr :LspPeekReferences<CR>
nnoremap <silent> <leader>ol :LspOutline<CR>

function! s:SmartHover() abort
	let result = execute('LspHover')
	if result =~ 'Error'
		call feedkeys('K', 'in')
	endif
endfunction

nnoremap <silent> K :call <SID>SmartHover()<CR>
nnoremap <silent> <RightMouse> :call <SID>SmartHover()<CR>
nnoremap <silent> <MiddleMouse> :LspPeekDefinition<CR>

nnoremap <silent> gd :LspGotoDefinition<CR>
nnoremap <silent> <C-.> :LspGotoDefinition<CR>
nnoremap <silent> gy :LspGotoTypeDef<CR>
nnoremap <silent> gi :LspGotoImpl<CR>
nnoremap <silent> gr :LspGotoDeclaration<CR>

command! -nargs=0 -bar -range=% Format <line1>,<line2>LspFormat
set formatexpr=lsp#lsp#FormatExpr() " Map LspFormat to the gq command
