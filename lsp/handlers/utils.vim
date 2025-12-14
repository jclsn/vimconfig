vim9script

export def BufnrToUri(bufnr: number): string
  var name = bufname(bufnr)
  if empty(name)
    return ''
  endif

  var fname = fnamemodify(name, ':p')
  return 'file://' .. fname
enddef


