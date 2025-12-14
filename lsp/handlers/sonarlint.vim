vim9script

import './utils.vim' as utils

export def IsOpenInEditor(lspserver: any, uri: any): bool
  for bufnr in range(1, bufnr('$'))
    if bufloaded(bufnr)
      if utils.BufnrToUri(bufnr) ==# uri.params[0]
        return true
      endif
    endif
  endfor
  return false
enddef

export def ShouldBeAnalyzed(lspserver: any, uri: any): dict<any>
  return { shouldBeAnalyzed: IsOpenInEditor(lspserver, uri) }
enddef

export def NeedCompilationDatabase(lspserver: any, cmd: any)
  var start = expand('%:p:h')
  var path = findfile('compile_commands.json', start .. ';')

  if !empty(path)
    g:LspRequestCustom(
      'sonartlint-ls',
      'workspace/didChangeConfiguration',
      {
        settings: {
          sonarlint: {
            pathToCompileCommands: fnamemodify(path, ':p'),
          },
        },
      },
    )
  else
    echohl ErrorMsg
    echom "Couldn't find compile_commands.json. Make sure it exists in a parent directory."
    echohl None
  endif
enddef

export def ListFilesInFolder(lspserver: any, message: any): dict<any>
  var folderUri = message.params.folderUri
  var prefix = 'file://'

  var folder = fnamemodify(folderUri, ':p')
  if folder[ : 6] ==# prefix
    folder = substitute(folder, '^' .. prefix, '', '')
  endif

  if folder[strlen(folder) - 1] !=# '/'
    folder ..= '/'
  endif

  var entries = glob(folder .. '*', false, true)
  var foundFiles: list<dict<any>> = []

  for entry in entries
    if !isdirectory(entry)
      var file = prefix .. entry
      foundFiles->add({
        fileName: file,
        filePath: folder,
      })
    endif
  endfor

  return { foundFiles: foundFiles }
enddef
