autocmd BufEnter,BufReadPre docker-compose.yaml,docker-compose.yml setf dockercompose
autocmd BufEnter,BufReadPre docker-compose.yaml,docker-compose.yml set syntax=yaml
let docker_ls =
			\ #{name: 'docker-language-server',
			\   path: 'docker-language-server',
			\   args: ['start', '--stdio'],
			\   filetype: ['dockerfile', 'dockercompose'],
			\ }
