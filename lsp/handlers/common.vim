vim9script

export def IgnoreMessage(lspserver: any, message: any): void
  return
enddef

export def PrintMessage(lspserver: any, message: any): void
  echo message
enddef
