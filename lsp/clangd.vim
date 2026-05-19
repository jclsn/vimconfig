" Return the directory that contains the first existing
" compile_commands.json, or a default if none is found.
function! s:FindCompileCommandsDir(candidates) abort
  let l:default    = './build/'

  for l:dir in a:candidates
    let l:json = l:dir . '/compile_commands.json'
    if filereadable(l:json)
      " Return just the directory part
      return fnamemodify(l:json, ':h')
    endif
  endfor

  return l:default
endfunction

let s:candidates = ['build/Release', 'build/Debug']

let clangd = {
      \ 'name': 'clangd',
      \ 'filetype': ['c', 'cpp'],
      \ 'path': 'clangd',
      \ 'args': [
      \           '--background-index',
      \           '--clang-tidy',
      \           '--completion-style=detailed',
      \           '--header-insertion=never',
      \           '--compile-commands-dir=' . s:FindCompileCommandsDir(s:candidates),
      \         ]
      \ }
