set tabstop=4
set shiftwidth=4

if has_key(plugs, 'vim-go')
    let g:go_fmt_command = 'gopls'
    let g:go_doc_keywordprg_enabled = 0
endif
