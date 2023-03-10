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
augroup END


