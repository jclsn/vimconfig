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
	\   completionTextEdit: v:false,
	\   diagVirtualTextAlign: 'above',
	\   noNewlineInCompletion: v:false,
	\   omniComplete: v:null,
	\   outlineOnRight: v:true,
	\   outlineWinSize: 40,
	\   semanticHighlight: v:false,
	\   showDiagInBalloon: v:false,
	\   showDiagInPopup: v:true,
	\   showDiagOnStatusLine: v:false,
	\   showDiagWithSign: v:true,
	\   showDiagWithVirtualText: v:false,
	\   showInlayHints: v:false,
	\   showSignature: v:true,
	\   snippetSupport: v:true,
	\   ultisnipsSupport: v:true,
	\   useBufferCompletion: v:true,
	\   usePopupInCodeAction: v:true,
	\   vsnipSupport: v:true,
	\   useQuickfixForLocations: v:false,
	\   bufferCompletionTimeout: 100,
	\   customCompletionKinds: v:false,
	\   completionKinds: {}
	\ }

autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = [
	\
	\ #{name: 'clang',
	\  filetype: ['c', 'cpp'],
	\  path: '/usr/bin/clangd',
	\  args: [
	\		'--background-index',
	\		'--clang-tidy',
	\		'--clang-tidy-checks=*',
	\		'--header-insertion=never',
	\		'--completion-style=detailed'
	\  ]
	\ },
	\
	\ #{name: 'bashls',
	\   filetype: 'sh',
	\   path: '/usr/bin/bash-language-server',
	\   args: ['start']
	\ },
	\
	\ #{name: 'bitbake',
	\   filetype: 'bitbake',
	\   path: '/usr/bin/bitbake-language-server'
	\ },
	\
	\ #{name: 'pyright',
	\   filetype: 'python',
	\   path: '/usr/bin/pyright-langserver',
	\   args: ['--stdio'],
	\   workspaceConfig: #{
	\     python: #{
	\       pythonPath: '/usr/bin/python'
	\     }
	\   }
	\ },
	\
	\ #{name: 'rustanalyzer',
	\   filetype: ['rust'],
	\   path: '/usr/bin/rust-analyzer',
	\   args: [],
	\   syncInit: v:true
	\ },
	\
	\ #{name: 'vimls',
	\   filetype: 'vim',
	\   path: '/usr/bin/vim-language-server',
	\   args: ['--stdio']
	\ },
	\
	\ #{name: 'vhdl_ls',
	\   filetype: 'vhdl',
	\   path: '/usr/bin/vhdl_ls',
	\   args: []
	\ }
	\]

autocmd VimEnter * call LspAddServer(lspServers)

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

nnoremap <leader>qf :LspCodeAction 1<CR>
nnoremap <silent> <leader>pe :LspDiagPrev<CR>
nnoremap <silent> <leader>ne :LspDiagNext<CR>
nnoremap <silent> <leader>pd :LspPeekDeclaration<CR>

function! s:SmartHover() abort
	let result = execute('LspHover')
	if result =~ 'Error'
		call feedkeys('K', 'in')
	endif
endfunction

nnoremap <silent> K :call <SID>SmartHover()<CR>

nnoremap <silent> gd :LspGotoDefinition<CR>
nnoremap <silent> gy :LspGotoTypeDef<CR>
nnoremap <silent> gi :LspGotoImpl<CR>
nnoremap <silent> gr :LspGotoDeclaration<CR>

command! Format call lsp#lsp#FormatExpr()
