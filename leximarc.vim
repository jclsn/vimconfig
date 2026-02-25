" =========================================
"  Lexima rules for common filetypes
"  Autoclose, leave, delete, and /* ... */
" =========================================

function! s:lexima_quotes(ft, pairs)
  for [open, close] in a:pairs
    call lexima#add_rule({'at': '\%#\w', 'char': open, 'input': open})
    call lexima#add_rule({'at': '\w\%#', 'char': open, 'input': open})
    call lexima#add_rule({'at': open . '\%#', 'char': close, 'input': close})
    call lexima#add_rule({'char': close, 'at': '\%#' . close, 'leave': 1, 'filetype': a:ft})
  endfor
endfunction

function! s:lexima_parens(ft, pairs)
  for [open, close] in a:pairs

    call lexima#add_rule({'at': '\%#\w', 'char': open, 'input': open})
    call lexima#add_rule({'char': close, 'at': '\%#' . close, 'leave': 1, 'filetype': a:ft})
  endfor
endfunction

function! s:comments(ft)
  call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': a:ft})
  call lexima#add_rule({'char': '*/', 'at': '\%#' . '*/', 'leave': 1, 'filetype': a:ft})
  call lexima#add_rule({'char': '<BS>', 'at': '/\*\%#.*\*/', 'delete': 7, 'filetype': a:ft})
  call lexima#add_rule({'char': '//', 'input': '//', 'filetype': a:ft })
endfunction

" Used for generics like std::vector<int>
function! s:generic_pairs(ft, pairs)
  for [open, close] in a:pairs
    call lexima#add_rule({ 'char': open, 'input_after': close, 'at': '\k\%#', 'filetype': a:ft })
    call lexima#add_rule({ 'char': close, 'at': '\%#' . close, 'leave': 1, 'filetype': a:ft })
    call lexima#add_rule({ 'char': '<BS>', 'at': open .. '\%#' .. close, 'delete': 1, 'filetype': a:ft })
  endfor
endfunction

" In dts files these pairs never exist without a semicolon at the end
function! s:dts_pairs(ft, pairs)
  for [open, close] in a:pairs
    call lexima#add_rule({'char': open, 'input_after': close .. ';', 'filetype': a:ft})
    call lexima#add_rule({'char': close, 'at': '\%#' .. close, 'leave': 1, 'filetype': a:ft})
    call lexima#add_rule({'char': ';', 'at': '\%#;', 'leave': 1, 'filetype': a:ft})
    call lexima#add_rule({'char': '<BS>', 'at': open .. '\%#' .. close .. ';', 'delete': 3, 'filetype': a:ft})
 endfor
endfunction

" Common pair sets
let s:default_parens = [
      \ ['(', ')'],
      \ ['{', '}'],
      \ ['[', ']'],
      \ ]

let s:default_quotes = [
      \ ['"', '"'],
      \ ["'", "'"],
      \ ["`", "`"],
      \ ]


let s:angle_pair = [['<', '>']]

" =========================================
" Enable Lexima parens and quotes separately
" =========================================

" bitbake
call s:lexima_parens('bitbake', s:default_parens)

" c
call s:lexima_parens('c', s:default_parens)
call s:lexima_quotes('c', s:default_quotes)
call s:comments('c')

" cpp
call s:lexima_parens('cpp', s:default_parens)
call s:lexima_quotes('cpp', s:default_quotes)
call s:generic_pairs('cpp', s:angle_pair)
call s:comments('cpp')

" css
call s:lexima_parens('css', [['{', '}'], ['[', ']']])
call s:lexima_quotes('css', [["'", "'"], ['"', '"']])
call s:comments('css')

" dts

call s:lexima_parens('dts', [['"', '"'],  ['<', '>']])
call s:lexima_quotes('dts', [['{', '}']])
call s:comments('dts')

" go
call s:lexima_parens('go', s:default_parens)
call s:lexima_quotes('go', s:default_quotes)
call s:comments('go')

" help
call s:lexima_quotes('help', [["'", "'"], ['"', '"']])

" html
call s:lexima_quotes('html', [["'", "'"], ['"', '"']])
call lexima#add_rule({'char': '>', 'at': '<\(\w\+\)\%#', 'input_after': '</\1>', 'with_submatch': 1, 'filetype': 'html'})

" javascript
call s:lexima_parens('javascript', s:default_parens)
call s:lexima_quotes('javascript', s:default_quotes)
call s:comments('javascript')

" json
call s:lexima_parens('json', [['{', '}'], ['[', ']']])
call s:lexima_quotes('json', [['"', '"']])

" jsonc
call s:lexima_parens('jsonc', [['{', '}'], ['[', ']']])
call s:lexima_quotes('jsonc', [['"', '"']])

" julia
call s:lexima_parens('julia', s:default_parens)
call s:comments('julia')
call s:lexima_quotes('julia', [['"', '"']])

" pkgbuild
call s:lexima_parens('pkgbuild', s:default_parens)
call s:lexima_quotes('pkgbuild', [["'", "'"], ['"', '"']])
call s:comments('pkgbuild')

" python
call s:lexima_parens('python', s:default_parens)
call s:lexima_quotes('python', s:default_quotes)

" rust
call s:lexima_parens('rust', s:default_parens)
call s:lexima_quotes('rust', [['"', '"']])
call s:generic_pairs('rust', s:angle_pair)
call s:comments('rust')

call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': 'rust'})
" char literals only
call lexima#add_rule({'char': "'", 'at': '\(^\|\s\|\k\)\%#', 'input_after': "'", 'filetype': 'rust'})
call lexima#add_rule({'char': "'", 'at': '\%#' . "'", 'leave': 1, 'filetype': 'rust'})

" sh
call s:lexima_parens('sh', s:default_parens)
call s:lexima_quotes('sh', s:default_quotes)

" systemd
call s:lexima_parens('systemd', s:default_parens)
call s:lexima_quotes('systemd', s:default_quotes)

" toml
call s:lexima_parens('toml', [['[', ']']])
call s:lexima_quotes('toml', [["'", "'"], ['"', '"']])

" typescript
call s:lexima_parens('typescript', s:default_parens)
call s:lexima_quotes('typescript', s:default_quotes)
call s:comments('typescript')

" vim
call s:lexima_parens('vim', [])
call s:lexima_quotes('vim', [["'", "'"], ['"', '"']])

" xml
call s:lexima_parens('xml', s:angle_pair)
call s:lexima_quotes('xml', [["'", "'"], ['"', '"']])
call lexima#add_rule({'char': '>', 'at': '<\(\w\+\)\%#', 'input_after': '</\1>', 'with_submatch': 1, 'filetype': 'xml'})

" yaml
call s:lexima_quotes('yaml', [["'", "'"], ['"', '"']])
