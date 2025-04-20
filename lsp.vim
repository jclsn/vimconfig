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
	\ #{name: 'bashls',
	\   filetype: 'sh',
	\   path: 'bash-language-server',
	\   args: ['start']
	\ },
	\
	\ #{name: 'bitbake',
	\   filetype: 'bitbake',
	\   path: 'bitbake-language-server'
	\ },
	\
	\ #{name: 'clangd',
	\  filetype: ['c', 'cpp'],
	\  path: 'clangd',
	\  args: [
	\		'--background-index',
	\		'--clang-tidy',
	\		'--clang-tidy-checks=*',
	\		'--header-insertion=never',
	\		'--completion-style=detailed'
	\  ]
	\ },
	\
	\ #{name: 'cmake-language-server',
	\   filetype: 'cmake',
	\   path: 'cmake-language-server'
	\ },
	\
	\ #{name: 'efm-langserver',
	\   filetype: ['markdown', 'sh', 'json', 'jsonc'],
	\   path: 'efm-langserver',
	\   args: [],
	\	initializationOptions: #{
	\ 	  documentFormatting: v:true,
	\ 	  documentRangeFormatting: v:true,
	\ 	  hover: v:true,
	\ 	  documentSymbol: v:true,
	\ 	  codeAction: v:true,
	\ 	  completion: v:true
	\	}
	\ },
	\
	\ #{name: 'ginko_ls',
	\   filetype: 'dts',
	\   path: 'ginko_ls',
	\ },
	\
	\ #{name: 'julia',
	\   filetype: 'julia',
	\   path: 'julia',
	\   args: ['--startup-file=no', '--history-file=no', '-e', '
	\       using LanguageServer;
	\       using Pkg;
	\       import StaticLint;
	\       import SymbolServer;
	\       env_path = dirname(Pkg.Types.Context().env.project_file);
	\
	\       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
	\       server.runlinter = true;
	\       run(server);
	\  ']
	\ },
	\
	\ #{name: 'marksman',
	\   filetype: 'markdown',
	\   path: 'marksman',
	\   args: [],
	\ },
	\
	\ #{name: 'pyright',
	\   filetype: 'python',
	\   path: 'pyright-langserver',
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
	\   path: 'rust-analyzer',
	\   args: [],
	\   syncInit: v:true
	\ },
	\
	\ #{name: 'vimls',
	\   filetype: 'vim',
	\   path: 'vim-language-server',
	\   args: ['--stdio']
	\ },
	\
	\ #{name: 'vhdl_ls',
	\   filetype: 'vhdl',
	\   path: 'vhdl_ls',
	\   args: []
	\ },
	\
	\ #{name: 'vscode-json-languageserver',
	\   filetype: ['json', 'jsonc'],
	\   path: 'vscode-json-languageserver',
	\   args: ['--stdio']
	\ }
	\]

autocmd VimEnter * call LspAddServer(lspServers)

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

nnoremap <leader>qf :LspCodeAction<CR>
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

command! -nargs=0 -bar -range=% Format <line1>,<line2>LspFormat
set formatexpr=lsp#lsp#FormatExpr() " Map LspFormat to the gq command
