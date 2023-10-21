
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools',]

nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

nnoremap <F4> :VimspectorReset<CR>

"nnoremap <LocalLeader>dr :VimspectorReset<CR>
"nnoremap <LocalLeader>dd <Plug>VimspectorContinue
"nnoremap <LocalLeader>ds <Plug>VimspectorStop
"nnoremap <LocalLeader>dp <Plug>VimspectorPause
"nnoremap <LocalLeader>db <Plug>VimspectorToggleBreakpoint
"nnoremap <LocalLeader>df <Plug>VimspectorAddFunctionBreakpoint
"
"nnoremap <LocalLeader>dj <Plug>VimspectorStepOver
"nnoremap <F10>      <Plug>VimspectorStepOver
"
"nnoremap <LocalLeader>dl <Plug>VimspectorStepInto
"nnoremap <F11>      <Plug>VimspectorStepInto
"
"nnoremap <LocalLeader>dh <Plug>VimspectorStepOut
"nnoremap <S-F11>    <Plug>VimspectorStepOut


nmap <LocalLeader>da :call AddToWatch()<CR>
" for normal mode - the word under the cursor
nmap <LocalLeader>di <Plug>VimspectorBalloonEval
" " for visual mode, the visually selected text
xmap <LocalLeader>di <Plug>VimspectorBalloonEval

nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame
nmap <LocalLeader>B     <Plug>VimspectorBreakpoints
nmap <LocalLeader>D     <Plug>VimspectorDisassemble

"let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nmap <F5>         <Plug>VimspectorContinue
nmap <S-F5>       <Plug>VimspectorStop
nmap <C-S-F5>     <Plug>VimspectorRestart
nmap <F6>         <Plug>VimspectorPause
nmap <F8>         <Plug>VimspectorJumpToNextBreakpoint
nmap <S-F8>       <Plug>VimspectorJumpToPreviousBreakpoint
nmap <F9>         <Plug>VimspectorToggleBreakpoint
nmap <S-F9>       <Plug>VimspectorAddFunctionBreakpoint
nmap <F10>        <Plug>VimspectorStepOver
nmap <F11>        <Plug>VimspectorStepInto
nmap <F12>        :Debug<CR>
nmap <S-F11>      <Plug>VimspectorStepOut
nmap <M-8>        <Plug>VimspectorDisassemble


autocmd User VimspectorJumpedToFrame normal zz
 func! AddToWatch()
   let word = expand("<cexpr>")
   call vimspector#AddWatch(word)
 endfunction

let g:vimspector_sign_priority = {
  \    'vimspectorBP':         101,
  \    'vimspectorBPCond':     102,
  \    'vimspectorBPLog':      103,
  \    'vimspectorBPDisabled': 104,
  \    'vimspectorPC':         105,
  \ }

" Creates a function to run :Make
function! RebuildAndDebug()
  Make
  cclose
  autocmd QuickFixCmdPost make ++once call RunVimspectorIfBuilt()
endfunction

" Catch the status value of :Make to no launch when building was unsuccessful
function! RunVimspectorIfBuilt()
  let status = +readfile(dispatch#request().file . '.complete', 1)[0]
  if status == 0
	call vimspector#Launch()
  endif
endfunction

" Finally, create a :Debug command to run all the above
command! Debug call RebuildAndDebug()

