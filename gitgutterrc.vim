nnoremap ]h <Plug>(GitGutterNextHunk)
nnoremap [h <Plug>(GitGutterPrevHunk)
nnoremap <leader>nh <Plug>(GitGutterNextHunk)
nnoremap <leader>ph <Plug>(GitGutterPrevHunk)

nnoremap <leader>sh <Plug>(GitGutterStageHunk)

autocmd BufEnter * GitGutter
