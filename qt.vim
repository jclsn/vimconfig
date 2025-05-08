let g:vimqt_assistant = '/usr/bin/assistant'
let g:qt_version = 'qt-6'

nnoremap <silent><leader>qa :QtAssist<CR>
nnoremap <silent><leader>qd :QtDoc<CR>

command Qt5Doc call QtOpenDocumentation('qt-5')
