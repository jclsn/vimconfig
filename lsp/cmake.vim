let cmake_language_server =
			\ #{name: 'cmake-language-server',
			\   filetype: 'cmake',
			\   path: 'cmake-language-server',
			\   initializationOptions: #{
			\		buildDirectory: "build"
			\	}
			\ }

let neocmakelsp =
			\ #{name: 'neocmakelsp',
			\   filetype: 'cmake',
			\   path: 'neocmakelsp',
			\   args: ['stdio'],
			\   initializationOptions: #{
			\		format: #{
			\			enable: v:true
			\		},
			\		lint: #{
			\			enable: v:true
			\		},
			\		semantic_token: v:true
			\   }
			\ }
