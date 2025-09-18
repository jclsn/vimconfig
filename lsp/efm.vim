let efm =
			\ #{name: 'efm-langserver',
			\   filetype: ['markdown', 'sh', 'json', 'jsonc'],
			\   path: 'efm-langserver',
			\   args: [],
			\	initializationOptions: #{
			\	  documentFormatting: v:true,
			\	  documentRangeFormatting: v:true,
			\	  hover: v:true,
			\	  documentSymbol: v:true,
			\	  codeAction: v:true,
			\	  completion: v:true,
			\	}
			\ }
