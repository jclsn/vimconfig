" For cdelledonne/vim-cmake
" let g:cmake_statusline = 1
" let g:cmake_root_markers = ['CMakeLists.txt']
" let g:cmake_generate_options=['-DCMAKE_EXPORT_COMPILE_COMMANDS=1', '-B', 'build']
" let g:cmake_build_dir_location='./build'

" augroup vim-cmake-group
"   autocmd! User CMakeBuildSucceeded CMakeClose
" augroup END

" For ReverentEngineer/vim-cmake

let g:cmake_args='-DCMAKE_EXPORT_COMPILE_COMMANDS=1'

command! CMakeRun call s:CMakeRun()
command! CMakeRunAsync call s:CMakeRunAsync()

" Run target in a terminal buffer (interactive)
function! s:CMakeRun()
  let l:target = s:FindCMakeTarget()
  if empty(l:target)
    echoerr "No add_executable() target found in CMakeLists.txt"
    return
  endif

  let l:cmd = "./build/" . l:target

  " Open terminal buffer and run
  execute "terminal " . l:cmd
endfunction

" Run target async (logs output into :messages)
function! s:CMakeRunAsync()
  let l:target = s:FindCMakeTarget()
  if empty(l:target)
    echoerr "No add_executable() target found in CMakeLists.txt"
    return
  endif

  let l:cmd = ["./build/" . l:target]
  call job_start(l:cmd, {})
endfunction

" Extract first add_executable() target
function! s:FindCMakeTarget()
  let l:lines = readfile("CMakeLists.txt")
  for l:line in l:lines
    if l:line =~? 'add_executable'
      let l:match = matchlist(l:line, 'add_executable\s*(\s*\([A-Za-z0-9_.-]\+\)')
      if len(l:match) > 1
        return l:match[1]
      endif
    endif
  endfor
  return ''
endfunction

" Handle async job output
function! s:JobOutput(tag, data)
  for l:line in a:data
    if !empty(l:line)
      echom a:tag . ': ' . l:line
    endif
  endfor
endfunction

