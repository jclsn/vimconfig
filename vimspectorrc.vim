let g:vimspector_install_gadgets = [ 
	\ 'debugpy', 
	\ 'vscode-cpptools', 
	\ 'CodeLLDB', 
	\ 'vscode-bash-debug'
\ ]

" let g:vimspector_terminal_minheight = 75

" Quit Vimspector
nnoremap <LocalLeader>q :call vimspector#Reset( { 'interactive': v:false } )<CR>
" Watches
nnoremap <LocalLeader>wa :call AddToWatch()<CR>
" Move up/down in the current call stack
nnoremap <S-F11> <Plug>VimspectorUpFrame
nnoremap <S-F12> <Plug>VimspectorDownFrame
" Open breakpoint or disassembly windows
nnoremap <LocalLeader>B     <Plug>VimspectorBreakpoints
nnoremap <LocalLeader>D     <Plug>VimspectorDisassemble
" Evaluate under cursor
nnoremap <LocalLeader>K <Plug>VimspectorBalloonEval
xnoremap <LocalLeader>K <Plug>VimspectorBalloonEval
" Run make and start debugger
nnoremap <S-F5>> :RebuildAndDebug<CR>

let g:vimspector_enable_mappings = 'HUMAN'

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

" Finally, create a :RebuildAndDebug command to run all the above
command! RebuildAndDebug call RebuildAndDebug()

if has_key(plugs, 'vim-smoothie')
	augroup MyVimspectorUICustomisation
	  autocmd!
	  autocmd User VimspectorUICreated let g:smoothie_enabled=0
	  autocmd User VimspectorTerminalOpened let g:smoothie_enabled=0
	  autocmd User VimspectorDebugEnded let g:smoothie_enabled=1
	augroup END
endif
