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

" Common pair sets
let s:default_pairs = [
      \ ['(', ')'],
      \ ['{', '}'],
      \ ['[', ']'],
      \ ['"', '"'],
      \ ["'", "'"],
      \ ]

let s:backtick_pair = [['`', '`']]
let s:angle_pair = [['<', '>']]

" -----------------------------------------
" bitbake
call s:lexima_pairs('bitbake', s:default_pairs)

" c
call s:lexima_pairs('c', s:default_pairs)
call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': 'c'})

" cpp
call s:lexima_pairs('cpp', s:default_pairs + s:angle_pair)
call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': 'cpp'})

" css
call s:lexima_pairs('css', [['{', '}'], ['[', ']'], ["'", "'"], ['"', '"']])
call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': 'css'})

" dts
call s:lexima_pairs('dts', s:default_pairs)
call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': 'dts'})

" go
call s:lexima_pairs('go', s:default_pairs + s:backtick_pair)
call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': 'go'})

" help
call s:lexima_pairs('help', [["'", "'"], ['"', '"']])

" html
call s:lexima_pairs('html', [["'", "'"], ['"', '"']])
call lexima#add_rule(#{char: '>', at: '<\(\w\+\)\%#', input_after: '</\1>', with_submatch: 1, filetype: 'html'})


" javascript
call s:lexima_pairs('javascript', s:default_pairs + s:backtick_pair)
call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': 'javascript'})

" json
call s:lexima_pairs('json', [['{', '}'], ['[', ']'], ['"', '"']])

" jsonc
call s:lexima_pairs('jsonc', [['{', '}'], ['[', ']'], ['"', '"']])

" julia
call s:lexima_pairs('julia', s:default_pairs)
call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': 'julia'})

" pkgbuild
call s:lexima_pairs('pkgbuild', s:default_pairs)
call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': 'pkgbuild'})

" python
call s:lexima_pairs('python', s:default_pairs + s:backtick_pair)

" rust
call s:lexima_pairs('rust', s:default_pairs)
call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': 'rust'})

" sh
call s:lexima_pairs('sh', s:default_pairs)

" systemd
call s:lexima_pairs('systemd', s:default_pairs + s:backtick_pair)

" toml
call s:lexima_pairs('toml', [["'", "'"], ['"', '"'], ['[', ']']])

" typescript
call s:lexima_pairs('typescript', s:default_pairs + s:backtick_pair)
call lexima#add_rule({'char': '/*', 'input': '/* ', 'input_after': ' */', 'filetype': 'typescript'})

" vim
call s:lexima_pairs('vim', s:default_pairs)

" xml
call s:lexima_pairs('xml', s:angle_pair + [["'", "'"], ['"', '"']])
call lexima#add_rule(#{char: '>', at: '<\(\w\+\)\%#', input_after: '</\1>', with_submatch: 1, filetype: 'xml'})

" yaml
call s:lexima_pairs('yaml', [["'", "'"], ['"', '"']])

