let clangd =  
			\ #{name: 'clangd',
			\  filetype: ['c', 'cpp'],
			\  path: 'clangd',
			\  args: [
			\		'--background-index',
			\		'--clang-tidy',
			\		'--completion-style=detailed'
			\  ]
			\ }
