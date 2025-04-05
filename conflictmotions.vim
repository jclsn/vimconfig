

nnoremap <silent><leader>nc :<C-U>call CountJump#CountJumpWithWrapMessage('n', '', '^<\{7}<\@!', 'bW')<CR>
nnoremap <silent><leader>pc :<C-U>call CountJump#CountJumpWithWrapMessage('n', '', '^>\{7}>\@!', 'bW')<CR>
nnoremap <silent><leader>cto <Plug>ConflictTakeOurs
nnoremap <silent><leader>ctt <Plug>ConflictTaketheirs

