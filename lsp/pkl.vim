let pkl = #{
            \   name: 'pkl-lsp',
            \   filetype: ['pkl'],
            \   path: 'java',
            \   args: [
            \     '-jar',
            \     '/usr/local/share/pkl/pkl-lsp.jar',
            \   ],
            \   initializationOptions: #{
            \     pkl_cli_path: '/usr/bin/pkl'
            \   },
            \   syncInit: v:true,
            \   debug: v:false
            \ }
