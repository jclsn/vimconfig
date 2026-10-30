augroup DockerCompose
	autocmd!
	autocmd BufRead,BufNewFile docker-compose.yaml,docker-compose.yml setlocal filetype=dockercompose syntax=yaml
augroup END
let docker_ls =
			\ #{name: 'docker-language-server',
			\   path: 'docker-language-server',
			\   args: ['start', '--stdio'],
			\   filetype: ['dockerfile', 'dockercompose'],
			\ }
