" =========================================
"  Lexima rules for common filetypes
"  Autoclose, leave, delete, and /* ... */
" =========================================

function! s:lexima_pairs(ft, pairs)
  for [open, close] in a:pairs
    call lexima#add_rule({'char': open, 'input_after': close, 'filetype': a:ft})
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
let s:default_pairs = [
      \ ['(', ')'],
      \ ['{', '}'],
      \ ['[', ']'],
      \ ['"', '"'],
      \ ["'", "'"],
      \ ]

let s:generic_pairs = [
      \ ['<', '>'],
      \ ]

let s:dts_pairs = [
      \ ['{', '}'],
      \ ['"', '"'],
      \ ['<', '>'],
      \ ]

let s:backtick_pair = [['`', '`']]
let s:angle_pair = [['<', '>']]

" -----------------------------------------
" bitbake
call s:lexima_pairs('bitbake', s:default_pairs)

" c
call s:lexima_pairs('c', s:default_pairs)
call s:comments('c')

" cpp
call s:lexima_pairs('cpp', s:default_pairs)
call s:comments('cpp')
call s:generic_pairs('cpp', s:generic_pairs)

" css
call s:lexima_pairs('css', [['{', '}'], ['[', ']'], ["'", "'"], ['"', '"']])
call s:comments('css')

" dts
call s:lexima_pairs('dts', s:default_pairs)
call s:comments('dts')
call s:dts_pairs('dts', s:dts_pairs)


" go
call s:lexima_pairs('go', s:default_pairs + s:backtick_pair)
call s:comments('go')

" help
call s:lexima_pairs('help', [["'", "'"], ['"', '"']])

" html
call s:lexima_pairs('html', [["'", "'"], ['"', '"']])
call lexima#add_rule(#{char: '>', at: '<\(\w\+\)\%#', input_after: '</\1>', with_submatch: 1, filetype: 'html'})

" javascript
call s:lexima_pairs('javascript', s:default_pairs + s:backtick_pair)
call s:comments('javascript')
" json

call s:lexima_pairs('json', [['{', '}'], ['[', ']'], ['"', '"']])

" jsonc
call s:lexima_pairs('jsonc', [['{', '}'], ['[', ']'], ['"', '"']])

" julia
call s:lexima_pairs('julia', s:default_pairs)
call s:comments('julia')

" pkgbuild
call s:lexima_pairs('pkgbuild', s:default_pairs)
call s:comments('pkgbuild')

" python
call s:lexima_pairs('python', s:default_pairs + s:backtick_pair)

" rust
let s:rust_default_pairs = [
      \ ['(', ')'],
      \ ['{', '}'],
      \ ['[', ']'],
      \ ['"', '"'],
      \ ]

call s:lexima_pairs('rust', s:rust_default_pairs)
call s:comments('rust')
call s:generic_pairs('rust', s:generic_pairs)
call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': 'rust'})

" Autoclose single quotes only for char literals, not lifetimes
call lexima#add_rule({'char': "'", 'at': '\(^\|\s\|\k\)\%#', 'input_after': "'", 'filetype': 'rust'})
call lexima#add_rule({'char': "'", 'at': '\%#' . "'", 'leave': 1, 'filetype': 'rust'})

" sh
call s:lexima_pairs('sh', s:default_pairs)

" systemd
call s:lexima_pairs('systemd', s:default_pairs + s:backtick_pair)

" toml
call s:lexima_pairs('toml', [["'", "'"], ['"', '"'], ['[', ']']])

" typescript
call s:lexima_pairs('typescript', s:default_pairs + s:backtick_pair)
call s:comments('typescript')

" vim
call s:lexima_pairs('vim', s:default_pairs)

" xml
call s:lexima_pairs('xml', s:angle_pair + [["'", "'"], ['"', '"']])
call lexima#add_rule(#{char: '>', at: '<\(\w\+\)\%#', input_after: '</\1>', with_submatch: 1, filetype: 'xml'})

" yaml
call s:lexima_pairs('yaml', [["'", "'"], ['"', '"']])
