
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools',]

nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

nnoremap <F4> :VimspectorReset<CR>
nnoremap <Leader>dr :VimspectorReset<CR>

nnoremap <Leader>dd <Plug>VimspectorContinue
nnoremap <Leader>ds <Plug>VimspectorStop
nnoremap <Leader>dp <Plug>VimspectorPause
nnoremap <Leader>dt <Plug>VimspectorToggleBreakpoint
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>
nnoremap <Leader>df <Plug>VimspectorAddFunctionBreakpoint

nnoremap <Leader>dj <Plug>VimspectorStepOver
nnoremap <F10>      <Plug>VimspectorStepOver

nnoremap <Leader>dl <Plug>VimspectorStepInto
nnoremap <F11>      <Plug>VimspectorStepInto

nnoremap <Leader>dh <Plug>VimspectorStepOut
nnoremap <S-F11>    <Plug>VimspectorStepOut


nnoremap <leader>da :call AddToWatch()<CR>

let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

autocmd User VimspectorJumpedToFrame normal zz
 func! AddToWatch()
   let word = expand("<cexpr>")
   call vimspector#AddWatch(word)
 endfunction
