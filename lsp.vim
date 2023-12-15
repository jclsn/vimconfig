let lspServers = [
	\
	\ #{name: 'clang',
	\  filetype: ['c', 'cpp'],
	\  path: '/usr/bin/clangd',
	\  args: ['--background-index']
	\ },
	\
	\ #{name: 'bashls',
	\   filetype: 'sh',
	\   path: '/usr/bin/bash-language-server',
	\   args: ['start']
	\ },
	\
	\ #{name: 'pyright',
	\   filetype: 'python',
	\   path: '/usr/bin/pyright-langserver',
	\   args: ['--stdio'],
	\   workspaceConfig: #{
	\     python: #{
	\       pythonPath: '/usr/bin/python3.11'
	\   }}
	\ },
	\
	\ #{name: 'vimls',
	\   filetype: 'vim',
	\   path: '/usr/bin/vim-language-server',
	\   args: ['--stdio']
	\ }
	\]

autocmd VimEnter * call LspAddServer(lspServers)

let lspOpts = #{
        \   aleSupport: v:false,
        \   autoComplete: v:true,
        \   autoHighlight: v:false,
        \   autoHighlightDiags: v:true,
        \   autoPopulateDiags: v:false,
        \   completionMatcher: 'case',
        \   completionMatcherValue: 1,
        \   diagSignErrorText: 'E>',
        \   diagSignHintText: 'H>',
        \   diagSignInfoText: 'I>',
        \   diagSignWarningText: 'W>',
        \   echoSignature: v:false,
        \   hideDisabledCodeActions: v:false,
        \   highlightDiagInline: v:true,
        \   hoverInPreview: v:false,
        \   ignoreMissingServer: v:false,
        \   keepFocusInDiags: v:true,
        \   keepFocusInReferences: v:true,
        \   completionTextEdit: v:true,
        \   diagVirtualTextAlign: 'above',
        \   noNewlineInCompletion: v:false,
        \   omniComplete: v:null,
        \   outlineOnRight: v:false,
        \   outlineWinSize: 20,
        \   semanticHighlight: v:true,
        \   showDiagInBalloon: v:true,
        \   showDiagInPopup: v:true,
        \   showDiagOnStatusLine: v:false,
        \   showDiagWithSign: v:true,
        \   showDiagWithVirtualText: v:false,
        \   showInlayHints: v:false,
        \   showSignature: v:true,
        \   snippetSupport: v:false,
        \   ultisnipsSupport: v:false,
        \   useBufferCompletion: v:false,
        \   usePopupInCodeAction: v:false,
        \   useQuickfixForLocations: v:false,
        \   vsnipSupport: v:false,
        \   bufferCompletionTimeout: 100,
        \   customCompletionKinds: v:false,
        \   completionKinds: {}
	\ }
autocmd VimEnter * call LspOptionsSet(lspOpts)

