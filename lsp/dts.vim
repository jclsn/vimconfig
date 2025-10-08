" https://github.com/Schottkyc137/ginko
let ginko = #{
    \   name: 'ginko_ls',
    \   filetype: 'dts',
    \   path: 'ginko_ls',
    \ }

" https://github.com/igor-prusov/dts-lsp
let dts_lsp = #{
    \   name: 'dts-lsp',
    \   filetype: ['dts', 'dtsi'],
    \   path: 'dts-lsp',
    \   args: [],
    \   root_uri: {server_info -> lsp#utils#path_to_uri(
    \       lsp#utils#find_nearest_parent_file_directory(expand('%:p'), '.git')
    \     )
    \   },
    \ }

" Register devicetree-language-server for DTS/DTSI files
let devicetree_ls = #{
    \   name: 'devicetree_ls',
    \   filetype: ['dts', 'dtsi'],
    \   path: 'devicetree-language-server',
    \   args: ['--stdio'],
    \   traceLevel: 'debug',
    \
    \   root_uri: {server_info -> lsp#utils#path_to_uri(
    \       lsp#utils#find_nearest_parent_file_directory(expand('%:p'), '.git', '.')
    \     )
    \   },
    \
    \	initializationOptions: #{
    \     automaticWorkspaceInit: v:true,
    \     settings: #{
    \       devicetree: #{
    \         cwd: getcwd(),
    \         defaultIncludePaths: [
    \           './include',
    \         ],
    \         defaultBindingType: 'DevicetreeOrg',
    \         contexts: [],
    \         defaultShowFormattingErrorAsDiagnostics: v:false
    \       }
    \     }
    \   }
    \ }
