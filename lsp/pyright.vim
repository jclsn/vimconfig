vim9script

# Detect Python path for Pyright
def GetPythonPath(): string
  var venv_python: string
  if has('win32') || has('win64')
    venv_python = expand('.\venv\Scripts\python.exe')
  else
    venv_python = expand('./venv/bin/python')
  endif

  # Check if venv exists
  if filereadable(venv_python)
    return venv_python
  else
    # fallback to system Python
    return 'python3'
  endif
enddef

g:pyright = {
  name: 'pyright',
  filetype: [
    'python',
  ],
  path: 'pyright-langserver',
  args: ['--stdio'],
  workspaceConfig: {
    python: {
      pythonPath: GetPythonPath(),
    },
  },
}
