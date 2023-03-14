" Author        : Jan Claussen
" Created       : 10/03/2023
" License       : MIT
" Description   :
"

let g:fern#renderer = "nerdfont"

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()

  hi GlyphPaletteDirectory guifg=#00a3cc ctermfg=38
augroup END

" Disable line numbers
augroup FernGroup
  autocmd FileType fern setlocal nornu | setlocal nonu
augroup END

function! s:init_fern() abort
endfunction

autocmd BufWritePost *  ++nested :FernDo  e! -drawer
