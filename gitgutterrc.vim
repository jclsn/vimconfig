set updatetime=100

let g:gitgutter_sign_priority=8

nnoremap ]h <Plug>(GitGutterNextHunk)
nnoremap [h <Plug>(GitGutterPrevHunk)
nnoremap <leader>nh <Plug>(GitGutterNextHunk)
nnoremap <leader>ph <Plug>(GitGutterPrevHunk)
nnoremap <leader>vh <Plug>(GitGutterPreviewHunk)
nnoremap <leader>uh <Plug>(GitGutterUndoHunk)

nnoremap <leader>sh <Plug>(GitGutterStageHunk)

" On Windows system() runs every command with cmd.exe in Vim's console. That
" is slow, changes the title of the terminal tab and gitgutter even calls it
" twice per command to restore v:shell_error. Run its git calls as jobs.
if has('win32') && has('job')
  function! s:System(cmd, ...) abort
    call gitgutter#debug#log(a:cmd, a:000)
    let l:cmd = a:cmd =~# '[|&<>^]' ? 'cmd.exe /s /c "' . a:cmd . '"' : a:cmd
    " Use files instead of channels, their callbacks do not run when this is
    " called from another job's callback
    let l:out = tempname()
    let l:opts = {'out_io': 'file', 'out_name': l:out, 'err_io': 'out'}
    if a:0
      let l:in = tempname()
      call writefile(split(a:1, "\n", 1), l:in, 'b')
      call extend(l:opts, {'in_io': 'file', 'in_name': l:in})
    else
      let l:opts.in_io = 'null'
    endif
    let l:job = job_start(l:cmd, l:opts)
    " Do not hang forever on a stuck git
    let l:start = reltime()
    while job_status(l:job) ==# 'run' && reltimefloat(reltime(l:start)) < 10
      sleep 1m
    endwhile
    if job_status(l:job) ==# 'run'
      call job_stop(l:job, 'kill')
    endif
    let l:status = job_status(l:job) ==# 'dead' ? job_info(l:job).exitval : -1
    let l:output = filereadable(l:out) ? join(readfile(l:out, 'b'), "\n") : ''
    call delete(l:out)
    if a:0
      call delete(l:in)
    endif
    return [l:output, l:status]
  endfunction

  let s:system = function('s:System')

  " Not a nested :function, that would load the autoload script right away
  function! s:OverrideSystem() abort
    call execute([
          \   'function! gitgutter#utility#system(cmd, ...) abort',
          \   '  return call(s:system, [a:cmd] + a:000)',
          \   'endfunction',
          \ ])
  endfunction

  augroup GitGutterSystem
    autocmd!
    autocmd SourcePost */autoload/gitgutter/utility.vim call s:OverrideSystem()
  augroup END
endif
