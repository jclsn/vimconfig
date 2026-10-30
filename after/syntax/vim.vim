" Highlight the arguments of vim-plug commands as expressions again. Since
" Vim 9.2.0954 (runtime 2026 Aug 12) user command arguments are an opaque
" vimUsrCmdArgs region without highlighting.
syn keyword vimPlugCmd contained Plug NodePlug PyPlug Vim9Plug skipwhite nextgroup=vimPlugArgs
syn region vimPlugArgs contained
      \ start="\S"
      \ skip=+\n\s*\%(\\\|["#]\\ \)+
      \ end="$"
      \ contains=@vimContinue,@vimExprList,vimComment
syn cluster vimCmdList add=vimPlugCmd

hi def link vimPlugCmd vimCommand
