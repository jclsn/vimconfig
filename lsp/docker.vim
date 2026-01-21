let dockerfile_ls =
		\ #{name: 'docker-langserver',
		\   path: 'docker-langserver',
		\   args: ['--stdio'],
		\   filetype: ['dockerfile'],
		\ }

function GetLanguageId()
	if expand('%:t') =~# 'docker-compose' && &filetype =~# 'yaml'
		return 'dockercompose'
	else
		return &filetype
	endif
endfunc

let docker_ls =
		\ #{name: 'docker-language-server',
		\   path: 'docker-language-server',
		\   args: ['start', '--stdio'],
		\   filetype: ['dockerfile', 'yaml'],
		\   debug: 'v:true',
		\   languageId: function('GetLanguageId')
		\ }

