let pyright =
			\ #{name: 'pyright',
			\   filetype: 'python',
			\   path: 'pyright-langserver',
			\   args: ['--stdio'],
			\   workspaceConfig: #{
			\     python: #{
			\       pythonPath: 'python'
			\     }
			\   }
			\ }
