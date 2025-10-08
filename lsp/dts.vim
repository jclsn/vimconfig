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
    \   root_uri: {server_info->
    \     lsp#utils#path_to_uri(
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
    \
    \   root_uri: {server_info ->
    \     lsp#utils#path_to_uri(
    \       lsp#utils#find_nearest_parent_file_directory(
    \         expand('%:p'),
    \         ['zephyr', '.git']
    \       )
    \     )
    \   },
    \
    \   settings: #{
    \     devicetree: #{
    \       cwd: getcwd(),
    \       defaultIncludePaths: [
    \         './zephyr/dts',
    \         './zephyr/dts/arm',
    \         './zephyr/dts/arm64',
    \         './zephyr/dts/riscv',
    \         './zephyr/dts/common',
    \         './zephyr/include'
    \       ],
    \       defaultBindingType: 'Zephyr',
    \       defaultZephyrBindings: ['./zephyr/dts/bindings'],
    \       autoChangeContext: v:true,
    \       allowAdhocContexts: v:true,
    \       contexts: []
    \     }
    \   }
    \ }
