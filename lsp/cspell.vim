let cspell_lsp =
			\ #{name: 'cspell-lsp',
			\   filetype: [
			\     'c',
			\     'cpp',
			\     'css',
			\     'dockercompose',
			\     'dockerfile',
			\     'gitcommit',
			\     'go',
			\     'html',
			\     'javascript',
			\     'json',
			\     'json',
			\     'julia',
			\     'markdown',
			\     'matlab',
			\     'pkl',
			\     'python',
			\     'rust',
			\     'ts',
			\     'vim',
			\     'yaml',
			\   ],
			\   path: 'cspell-lsp',
			\   args: ['--stdio',
			\		   '--sortWords',
			\		   '--config', '/home/jan/.vim/cSpell.json',
			\   ]
			\ }

let codebook =
			\ #{name: 'codebook',
			\   filetype: [
			\     'c',
			\     'cpp',
			\     'css',
			\     'dockercompose',
			\     'dockerfile',
			\     'gitcommit',
			\     'go',
			\     'html',
			\     'javascript',
			\     'json',
			\     'json',
			\     'julia',
			\     'markdown',
			\     'matlab',
			\     'pkl',
			\     'python',
			\     'rust',
			\     'ts',
			\     'vim',
			\     'yaml',
			\   ],
			\   path: 'codebook-lsp',
			\   args: ['serve'
			\   ],
			\   root_markers: [ '.git', 'codebook.toml', '.codebook.toml' ],
			\   initializationOptions: #{
			\		globalConfigPath: $MYVIMDIR .. 'codebook.toml'
			\   }
			\ }
