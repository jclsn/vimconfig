
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools',]
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>
nmap <Leader>dr :VimspectorReset<CR>
nmap <F4> :VimspectorReset<CR>
nmap <Leader>dd <Plug>VimspectorContinue
nmap <Leader>ds <Plug>VimspectorStop
nmap <Leader>dp <Plug>VimspectorPause
nmap <Leader>db <Plug>VimspectorToggleBreakpoint
nmap <Leader>df <Plug>VimspectorAddFunctionBreakpoint
nmap <Leader>dj <Plug>VimspectorStepOver
nmap <F10>      <Plug>VimspectorStepOver
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <F11>      <Plug>VimspectorStepInto
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <S-F11>    <Plug>VimspectorStepOut
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

nnoremap <leader>da :call AddToWatch()<CR>
autocmd User VimspectorJumpedToFrame normal zz
 func! AddToWatch()
   let word = expand("<cexpr>")
   call vimspector#AddWatch(word)
 endfunction
