let dockerfile_ls =
			\ #{name: 'docker-langserver',
			\   path: 'docker-langserver',
			\   args: ['--stdio'],
			\   filetype: ['dockerfile'],
			\ }

let docker_ls =
			\ #{name: 'docker-language-server',
			\   path: 'docker-language-server',
			\   args: ['start', '--stdio'],
			\   filetype: ['dockerfile'],
			\   debug: 'v:true'
			\ }
