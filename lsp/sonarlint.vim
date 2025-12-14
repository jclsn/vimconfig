function! s:IgnoreMessage(lspserver, message)
  return
endfunction

function! s:PrintMessage(lspserver, message)
  echo a:message
endfunction

function! s:BufnrToUri(bufnr) abort
  let l:name = bufname(a:bufnr)
  if empty(l:name)
    return ''
  endif

  let l:fname = fnamemodify(l:name, ':p')
  return 'file://' .. l:fname
endfunction

function! s:IsOpenInEditor(lspserver, uri) abort
  for l:bufnr in range(1, bufnr('$'))
    if bufloaded(l:bufnr)
      if s:BufnrToUri(l:bufnr) ==# a:uri.params[0]
        echo a:uri.params[0] . " is open"
        return v:true
      endif
    endif
  endfor
  return v:false
endfunction

function! s:ShouldBeAnalyzed(lspserver, uri) abort
  return { 'shouldbeAnalyzed': s:IsOpenInEditor(lspserver, uri) }
endfunction

function! s:NeedCompilationDatabase(lspserver, cmd) abort
  echo a:cmd
  return

  " Start searching from current buffer directory
  let l:start = expand('%:p:h')

  " Search upward for compile_commands.json
  let l:path = findfile('compile_commands.json', l:start . ';')

  if !empty(l:path)
    " Send updated configuration to the LSP client
    call LspRequestCustom(
          \ 'sonartlint-ls',
          \ 'workspace/didChangeConfiguration',
          \ {
          \   'settings': {
          \     'sonarlint': {
          \       'pathToCompileCommands': fnamemodify(l:path, ':p')
          \     }
          \   }
          \ }
          \ )
  else
    echohl ErrorMsg
    echom "Couldn't find compile_commands.json. Make sure it exists in a parent directory."
    echohl None
  endif
endfunction

function! s:ListFilesInFolder(lspserver, message) abort
  let s:folderUri = a:message.params.folderUri

  " Convert URI to file path
  let l:folder = fnamemodify(s:folderUri, ':p')
  if l:folder[:6] == 'file://'
    let l:folder = substitute(l:folder, '^file://', '', '')
  endif

  " Ensure folder path ends with a slash
  if l:folder[strlen(l:folder)-1] !=# '/'
    let l:folder .= '/'
  endif

  " let l:entries = glob(l:folder . '*', 0, 1)
  " for l:entry in l:entries
  "   echow l:entry
  " endfor
  " return
  " " Get all entries in folder
  " let l:entries = split(glob(l:folder . '*', 0, 1), '\n')

  let l:entries = glob(l:folder . '*', 0, 1)
  let l:foundFiles = []

  for l:entry in l:entries
    if !isdirectory(l:entry)
      call add(l:foundFiles, {
            \ 'fileName': fnamemodify(l:entry, ':t'),
            \ 'filePath': l:folder,
            \ })
    endif
  endfor

  return {'foundFiles': l:foundFiles}
endfunction

let sonarlint = #{
            \   name: 'sonarlint-ls',
            \   filetype: ['c', 'cpp'],
            \   path: 'sonarlint-ls',
            \   args: [
            \     '-stdio',
            \     '-analyzers',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarcfamily.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonargo.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarhtml.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonariac.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarjava.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarjs.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarlintomnisharp.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarphp.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarpython.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonartext.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarxml.jar',
            \   ],
            \   debug: v:true,
            \   syncInit: v:true,
            \   initializationOptions: #{
            \     productKey: 'Vim',
            \     productName: 'Sonarlint Vim',
            \     telemetryStorage: '~/.cache/sonarlint',
            \     showVerboseLogs: v:true,
            \     platform: 'linux',
            \     architecture: 'x64',
            \     additionalAttributes: #{
            \       vscode: #{
            \           isTelemetryEnabled: v:false },
            \     },
            \     sonarlint: #{
            \       pathToCompileCommands: './build/compile_commands.json',
            \       trace: #{
            \             server: 'verbose' }
            \     }
            \   },
            \   customNotificationHandlers: {
            \           'sonarlint/settingsApplied': function('s:IgnoreMessage'),
            \   },
            \   customRequestHandlers: {
            \           'sonarlint/NeedCompilationDatabase': function('s:NeedCompilationDatabase'),
            \           'sonarlint/isOpenInEditor': function('s:IsOpenInEditor'),
            \           'sonarlint/listFilesInFolder': function('s:ListFilesInFolder'),
            \           'sonarlint/shouldBeAnalyzed': function('s:ShouldBeAnalyzed'),
            \   }
            \ }
