let julia =
			\ #{name: 'julia',
			\   filetype: 'julia',
			\   path: 'julia',
			\   args: ['--startup-file=no', '--history-file=no', '-e', '
			\       using LanguageServer;
			\       using Pkg;
			\       import StaticLint;
			\       import SymbolServer;
			\       env_path = dirname(Pkg.Types.Context().env.project_file);
			\
			\       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "' . getcwd() . '");
			\       server.runlinter = true;
			\       run(server);
			\  ']
			\ }

let jetls =
			\ #{name: 'JETLS',
			\   filetype: 'julia',
			\   path: 'jetls',
			\   args: [
			\       '--threads=auto',
			\       '--'
			\   ]
			\ }
