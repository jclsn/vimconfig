let clangd =  
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
			\ }
