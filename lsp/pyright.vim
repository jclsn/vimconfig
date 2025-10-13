
" Detect Python path for Pyright
function! GetPythonPath() abort
  if has('win32') || has('win64')
    let l:venv_python = expand('.\venv\Scripts\python.exe')
  else
    let l:venv_python = expand('./venv/bin/python')
  endif

  " Check if venv exists
  if filereadable(l:venv_python)
    return l:venv_python
  else
    " fallback to system Python
    return 'python3'
  endif
endfunction

let pyright = #{name: 'pyright',
  \   filetype: 'python',
  \   path: 'pyright-langserver',
  \   args: ['--stdio'],
  \   workspaceConfig: #{
  \     python: #{
  \       pythonPath: GetPythonPath()
  \     }
  \   }
  \ }
