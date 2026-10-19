vim9script

# Locate the compilation database shared by clangd
const CANDIDATES = ['.', 'build/Release', 'build/Debug']

def FindCompileDB(candidates: list<string> = CANDIDATES): string
  for dir in candidates
    var json = $'{dir}/compile_commands.json'
    if json->filereadable()
      return json->fnamemodify(':p:h')
    endif
  endfor
  return ''
enddef

# Without a database clangd searches the parent directories of each file.
const compileCommandsDir = FindCompileDB()

g:clangd = {
  name: 'clangd',
  filetype: [
    'c',
    'cpp',
  ],
  path: 'clangd',
  args: [
    '--background-index',
    '--clang-tidy',
    '--completion-style=detailed',
    '--header-insertion=never',
  ] + (compileCommandsDir->empty() ? [] : [$'--compile-commands-dir={compileCommandsDir}']),
}
